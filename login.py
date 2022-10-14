import mysql.connector
from PySimpleGUI import PySimpleGUI as sg

sg.theme('Reddit')
#Criando o layout do login
interface = [
    [sg.Text('Login',size=(5,1)),sg.Input(key='login', size=(30,1))],
    [sg.Text('Senha',size=(5,1)),sg.Input(key='senha', password_char='*', size=(30,1))],
   #[sg.Checkbox('Salvar o login ?')],
    [sg.Button('Entrar')]
]

janela = sg.Window('Tela de Login', interface)



#Conectando ao banco de dados
mydbLocalhost = mysql.connector.connect(
            host="Localhost", # Tipo de banco (utilizei local)
            user="root", # Usuário do banco
            password="7412369", # Senha do banco
            database="sistema" # Nome do banco
        )

cursor = mydbLocalhost.cursor()
cursor.execute("SELECT * FROM conta WHERE status = 1")
resultado = cursor.fetchall()




while True:
    eventos, valores = janela.read()
    if eventos == sg.WINDOW_CLOSED:
        break
    if eventos == 'Entrar':
        for i in resultado:
            if (valores['login'] == i[2] and valores['senha'] == i[3]):
                print('Bem vindo {} !'.format(i[1]))