import http from 'http'
import { toJSON, toCSV, toImport, index, noEncontrado } from './lib.js'

const server = http.createServer(async (req, res) => {
  const { method, url } = req
  if (method === 'GET') {
    switch (url) {
      case '/':
        index(res, req)
        break

      case '/api/usuarios':
        toJSON(res)
        break

      case '/api/usuarios/export':
        toCSV(res)
        break

      case '/api/usuarios/import':
        toImport(res)
        break

      default:
        noEncontrado(res)
        break
    }
  }
})

const port = process.env.PORT || 3000
server.listen(port, () => {
  console.log('Server is running on port ' + port)
})
