# 🚀 Testes Automatizados - Robot Framework

Este repositório contém testes automatizados utilizando o **Robot Framework** para garantir a qualidade do sistema.  
Os testes incluem automação web com **Selenium**, requisições API com **RequestsLibrary**, manipulação de strings e arquivos.

---

## 📂 Estrutura do Projeto

📦 **Resources/** → Contém bibliotecas, variáveis, keywords reutilizáveis e configurações gerais.  
📦 **TestCases/** → Contém os casos de teste organizados por módulos.  
📜 **Main.robot** → Arquivo principal para execução dos testes.

---

## 🛠️ **Pré-requisitos**

Para rodar os testes, instale os seguintes softwares:

1️⃣ **Python (3.x recomendado)** → [Download](https://www.python.org/downloads/)  
2️⃣ **Google Chrome** (ou outro navegador compatível)  
3️⃣ **ChromeDriver** → [Download](https://sites.google.com/chromium.org/driver/) (caso use Selenium)  
4️⃣ **Robot Framework e bibliotecas adicionais**

---

## 📦 **Instalação**

### 1️⃣ **Clone este repositório**:

```sh
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2️⃣ **Instale as bibliotecas e dependências(opcional, mas recomendado):**
No Windows (cmd/powershell)
```sh
python -m venv venv
venv\Scripts\activate
```

No Mac/Linux
```sh
sudo apt update
sudo apt install python3-venv
python3 -m venv venv
source venv/bin/activate
```

### 3️⃣ **Instale as dependências:**

```sh
pip install -r requirements.txt
```

## **▶️ Executando os Testes:**

```sh
robot -d results TestCases/
```

- robot → Comando para executar testes Robot Framework.
- -d results → Salva os relatórios de execução na pasta results/.
- TestCases/ → Diretório onde estão os testes.

### **🛠 Executando testes específicos:**

Rodar apenas um teste:
```sh
robot -d results TestCases/CN01-Início.robot
```

Rodar todos os testes relacionados a um módulo:
```sh
robot -d results TestCases/CN0*-Obras.robot
```