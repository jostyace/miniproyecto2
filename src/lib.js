import { pool } from './db.js'
import fs from 'node:fs/promises'
import path from 'node:path'

export async function index (res, req) {
  try {
    const indexFile = path.resolve('./public/index.html')
    const indexData = await fs.readFile(indexFile, 'utf8')
    res.writeHead(200, { 'Content-Type': 'text/html' })
    res.write(indexData)
    res.end()
  } catch (error) {
    res.writeHead(500)
    return res.end('error dentro del servido')
  }
}

export async function noEncontrado (res) {
  try {
    const pathNot = path.resolve('./public/404.html')
    const notData = await fs.readFile(pathNot, 'utf8')
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' })
    res.write(notData)
    res.end()
  } catch (error) {
    res.writeHead(500)
    return res.end('error dentro del servido')
  }
}

export const toJSON = async (res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios')
    res.writeHead(200, { 'Content-Type': 'application/json' })
    res.write(JSON.stringify(result[0]))
    res.end()
  } catch (error) {
    manejarError(res, error)
  }
}

export const toCSV = async (res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios')
    jsonToCsv(result[0], res)
    manejarOk(res, 'Se ha guardado el Archivo CSV')
  } catch (error) {
    manejarError(res, error)
  }
}

export const toImport = async (res) => {
  try {
    const datos = await fs.readFile('./src/usuarios.csv', 'utf8')
    validar(datos, res)
  } catch (error) {
    manejarError(res, error)
  }
}

async function jsonToCsv (result, res) {
  const encabezado = 'id,nombres,apellidos,direccion,correo_electronico,dni,edad,fecha_creacion,telefono'
  let csvContent = encabezado
  result.forEach((usuario) => {
    csvContent += '\n' + Object.values(usuario).join(',')
  })
  try {
    await fs.writeFile('./src/usuarios.csv', csvContent)
  } catch (error) {
    manejarError(res, error)
  }
}

async function validar (datos, res) {
  const encabezados = datos.split('\n')[0].split(',')
  let saltados = 0
  let enviados = 0
  let conErrores = 0
  console.log(encabezados)
  if ((encabezados.length === 9) & (encabezados == 'id,nombres,apellidos,direccion,correo_electronico,dni,edad,fecha_creacion,telefono')) {
    const conHeader = datos.split('\n')
    const datosFilas = conHeader.slice(1)
    for (const data of datosFilas) {
      const d = data.split(',')
      const [id, nombres, apellidos, direccion, correo, dni, edad] = d
      let vacio = false

      //    VALIDACIONES
      const dniIdInvalido = isNaN(dni) || (dni.length < 9) || isNaN(id)
      const edadInvalido = isNaN(edad) || (edad < 0)
      const correoInvalido = !validarFormatoCorreo(correo)
      const stringsInvalidas = !isString(nombres) || !isString(apellidos) || !isString(direccion)

      //    VALIDAR CAMPOS VACIOS EN LA FILA
      d.forEach((value) => {
        const campoActual = value.trim()
        if (!campoActual) { vacio = true }
      })

      if (vacio) {
        console.log('Esta fila tiene campos vacios, saltando a la siguiente fila')
        conErrores++
        continue
      }

      //  VALIDAR DATOS O FORMATOS INCORRECTOS
      if (dniIdInvalido || edadInvalido || correoInvalido || stringsInvalidas) {
        console.log('El ID, DNI, correo o la Edad tienen formato Incorrecto, saltando Elemento')
        conErrores++
        continue
      }

      //    VALIDAR DUPLICADOS
      const verificarExistencia = 'SELECT id FROM usuarios WHERE id = ? OR correo_electronico = ?'
      const existeRegistro = await pool.query(verificarExistencia, [id, correo])
      if (existeRegistro[0].length > 0) {
        console.log('El ID o el Correo ya existen, saltando Elemento')
        saltados++
        continue
      }

      //  INSERTAR REGISTROS
      const query = 'INSERT INTO usuarios (id,nombres,apellidos,direccion,correo_electronico,dni,edad,fecha_creacion,telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'
      await pool.query(query, d)
      console.log('Guardado Correctamente en la Base de Datos')
      enviados++
    }
    validEmail('jostyace@gmail.com')
    manejarOk(
      res, 'Se ha Importado el Archivo CSV (Enviados: ' + enviados + ' - Con Errores: ' + conErrores + ' - Saltados: ' + saltados + ')'
    )
  } else {
    const columnas = encabezados.length
    const pathInvalid = path.resolve('./public/invalid.html')
    const invalidData = await fs.readFile(pathInvalid, 'utf8')
    const invalidWithData = invalidData.replace(/{{encabezado}}/g, encabezados).replace(/{{columnas}}/g, columnas)
    res.writeHead(500, { 'Content-Type': 'text/html; charset=utf-8' })
    res.write(invalidWithData)
    res.end()
  }
}

export async function manejarError (res, error) {
  let msg = ''
  switch (error.errno) {
    case 1146:
      msg = 'La Tabla Seleccionada no existente'
      break
    case 1054:
      msg = 'La Columna solicitada no existe en la Tabla'
      break
    case 1064:
      msg = 'Error de Sintáxis en la Consulta SQL'
      break
    case -4048:
      msg = 'No hay permisos para modificar/leer el Archivo usuarios.csv'
      break
    case -4058:
      msg =
        'No se pudo encontrar el Archivo usuarios.csv en la ubicación: ' + error.path
      break
    case -3008:
      msg = 'No se encontró localhost'
      break
    default:
      msg = 'Se ha producido un error no especificado'
      break
  }
  try {
    const pathFile = path.resolve('./public/500.html')
    const indexData = await fs.readFile(pathFile, 'utf8')
    const htmlWithData = indexData.replace('{{error}}', msg)
    res.writeHead(500, { 'Content-Type': 'text/html; charset=utf-8' })
    res.write(htmlWithData)
    res.end()
  } catch (error) {
    res.writeHead(500)
    return res.end('error dentro del servidor')
  }
}

export async function manejarOk (res, message) {
  try {
    const resultFile = path.resolve('./public/result.html')
    const resultData = await fs.readFile(resultFile, 'utf8')
    const resultWithData = resultData.replace('{{result}}', message)
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' })
    res.write(resultWithData)
    res.end()
  } catch (error) {
    res.writeHead(500)
    return res.end('error dentro del servidor')
  }
}

function validarFormatoCorreo (correo) {
  const regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return regexCorreo.test(correo)
}

function validEmail (correo) {
  const splitAlt = correo.split('@')
  console.log(splitAlt)
  const hasAlt = splitAlt.length === 2
  console.log(hasAlt)
  const splitDot = splitAlt[1].split('.')
  console.log(splitDot)
  const hasDot = splitDot.length === 2
  console.log(hasDot)
}

function isString (variable) {
  return typeof variable === 'string'
}
