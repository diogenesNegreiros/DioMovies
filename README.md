# MovieAppSwiftUI (GraphQL manual)

Este projeto SwiftUI consome uma API GraphQL mocado, sem dependências externas de servidor local.

### ✅ Requisitos

- Xcode 14+
- Swift 5+

### 📦 Estrutura

Arquitetura MVVM:

- Models/: Modelo do filme
- ViewModels/: ViewModel que faz a requisição GraphQL manualmente, e se comunica com a View.
- Views/: Interface com SwiftUI

- Network/: Chamadas e a comunicação com a API.
- Resources/: Arquivo Json para mocar a API.

Utilitários:
- Utils/: Para mocar um filme e usa-lo nos Previews do SwiftUI.

### Para interface gráfica SwiftUI:
- Escolhido por ser declarativo e reativo, sendo a maneira mais moderna de construir telas. 

### 🚀 Uso
Sem dependências externas, basta rodar o app.

Tela de lista de filmes:
- Listar filmes com: imagem, título, ano e nota.

Tela de detalhes do filme:
Ao selecionar um filme mostrar:
- Imagem de destaque
- Título
- Descrição
- Ano de lançamento
- Duração
- Nota (ex: 8.7/10)
- Miniplayer com o video embedded
- Consumo via GraphQL
 
Os dados da API estão no JSON.

### Boas práticas aplicadas

- Componentização das views com SwiftUI, para facilitar a reutilização.
- Separação de responsabilidades.
- Tratativas de erro.

### Diferenciais

- SwiftUI
- Testes unitários

