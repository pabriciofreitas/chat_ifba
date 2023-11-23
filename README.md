# chat_ifba

# Links importantes:

# Aplicação rodando em:

https://pabriciofreitas.github.io/

# firebase:

https://console.firebase.google.com/u/0/

# github do projeto:
https://github.com/pabriciofreitas/chat_ifba

# acessa projeto vscode :
https://github.dev/pabriciofreitas/chat_ifba
# comando para criar projeto 
flutter create nome_do_projeto
# Scritps para por no index.html

<meta name="google-signin-client_id" content="387890314717-7vja5rjtngihstn4ng264ec6agp6o68c.apps.googleusercontent.com">

<script>src="https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js"</script>

<script>src="https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js"</script>

<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyD9JnOUVnOVE-SzcUf-ycRsHWHMPvoHvMA",
    authDomain: "chat-ifba.firebaseapp.com",
    projectId: "chat-ifba",
    storageBucket: "chat-ifba.appspot.com",
    messagingSenderId: "387890314717",
    appId: "1:387890314717:web:af585fd9b82690f9e7ca34",
    measurementId: "G-JH3SGZ4JM0"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>

# Run flutter web

flutter run -d chrome --web-hostname localhost --web-port 7357

# Urls que teram permissão de autenticar com google

pabriciofreitas.github.io
http://localhost and
http://localhost:7357

# Configuração das privacidades do firebase

rules_version = '2';

service cloud.firestore {
match /databases/{database}/documents {
match /{document=\*\*} {
allow read: if request.auth.uid != null;
allow write: if request.auth.uid != null;
}
match /chat {
allow read: if request.auth.uid != null;
allow write: if request.auth.uid != null;
}
}
}

# Ativar modo dev do windows

start ms-settings:developers

# Gerar pasta da aplicação web

flutter build web --web-renderer canvaskit
