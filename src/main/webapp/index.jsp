<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClinicPro - Gestion de Clinique</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');
        body { font-family: 'Inter', sans-serif; }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body class="gradient-bg min-h-screen">
<!-- Navigation -->
<nav class="bg-white/10 backdrop-blur-md border-b border-white/20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center space-x-2">
                <div class="bg-white rounded-lg p-2">
                    <svg class="h-6 w-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path>
                    </svg>
                </div>
                <h1 class="text-2xl font-bold text-white">ClinicPro</h1>
            </div>
            <div class="hidden md:flex items-center space-x-8">
                <a href="#" class="text-white hover:text-purple-200 transition">Accueil</a>
                <a href="#" class="text-white hover:text-purple-200 transition">Fonctionnalités</a>
                <a href="#" class="text-white hover:text-purple-200 transition">À propos</a>
                <a href="#" class="text-white hover:text-purple-200 transition">Contact</a>
            </div>
            <div class="hidden md:flex items-center space-x-4">
                <button onclick="showLogin()" class="text-white hover:text-purple-200 transition font-medium">Connexion</button>
                <button onclick="showRegister()" class="bg-white text-purple-600 px-6 py-2 rounded-lg font-medium hover:bg-purple-50 transition">S'inscrire</button>
            </div>
            <button onclick="toggleMobileMenu()" class="md:hidden text-white">
                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
            </button>
        </div>
    </div>
    <!-- Mobile Menu -->
    <div id="mobileMenu" class="hidden md:hidden bg-white/10 backdrop-blur-md border-t border-white/20">
        <div class="px-4 py-4 space-y-3">
            <a href="#" class="block text-white hover:text-purple-200">Accueil</a>
            <a href="#" class="block text-white hover:text-purple-200">Fonctionnalités</a>
            <a href="#" class="block text-white hover:text-purple-200">À propos</a>
            <a href="#" class="block text-white hover:text-purple-200">Contact</a>
            <button onclick="showLogin()" class="block w-full text-left text-white hover:text-purple-200">Connexion</button>
            <button onclick="showRegister()" class="block w-full bg-white text-purple-600 px-4 py-2 rounded-lg font-medium">S'inscrire</button>
        </div>
    </div>
</nav>

<!-- Hero Section with Login/Register -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-20">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
        <!-- Left Side - Marketing Content -->
        <div class="text-white space-y-6">
            <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold leading-tight">
                Gérez votre clinique en toute simplicité
            </h1>
            <p class="text-lg sm:text-xl text-purple-100">
                Solution complète pour la gestion des patients, rendez-vous, dossiers médicaux et bien plus encore.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 pt-4">
                <button onclick="showRegister()" class="bg-white text-purple-600 px-8 py-4 rounded-lg font-semibold text-lg hover:bg-purple-50 transition shadow-lg">
                    Commencer gratuitement
                </button>
                <button class="bg-purple-700/50 backdrop-blur-sm text-white px-8 py-4 rounded-lg font-semibold text-lg hover:bg-purple-700 transition border-2 border-white/30">
                    Voir la démo
                </button>
            </div>
            <div class="flex items-center gap-8 pt-8">
                <div>
                    <p class="text-3xl font-bold">5000+</p>
                    <p class="text-purple-200">Cliniques</p>
                </div>
                <div>
                    <p class="text-3xl font-bold">50K+</p>
                    <p class="text-purple-200">Patients</p>
                </div>
                <div>
                    <p class="text-3xl font-bold">4.9★</p>
                    <p class="text-purple-200">Évaluation</p>
                </div>
            </div>
        </div>

        <!-- Right Side - Login/Register Forms -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 lg:p-10">
            <!-- Login Form -->
            <div id="loginForm" class="space-y-6">
                <div class="text-center">
                    <h2 class="text-3xl font-bold text-gray-800">Connexion</h2>
                    <p class="text-gray-600 mt-2">Accédez à votre espace clinique</p>
                </div>

                <form class="space-y-5" action="login" method="post">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Adresse email</label>
                        <input type="email" name="email" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="exemple@clinique.com">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mot de passe</label>
                        <input type="password" name="password" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="••••••••">
                    </div>

                    <div class="flex items-center justify-between">
                        <label class="flex items-center">
                            <input type="checkbox" class="w-4 h-4 text-purple-600 border-gray-300 rounded focus:ring-purple-500">
                            <span class="ml-2 text-sm text-gray-700">Se souvenir de moi</span>
                        </label>
                        <a href="#" class="text-sm text-purple-600 hover:text-purple-700 font-medium">Mot de passe oublié?</a>
                    </div>

                    <button type="submit" class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition shadow-lg">
                        Se connecter
                    </button>
                </form>

                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-white text-gray-500">Ou continuer avec</span>
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <button class="flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
                        <svg class="w-5 h-5 mr-2" viewBox="0 0 24 24">
                            <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                            <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                            <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                            <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                        </svg>
                        <span class="text-sm font-medium text-gray-700">Google</span>
                    </button>
                    <button class="flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
                        <svg class="w-5 h-5 mr-2" fill="#1877F2" viewBox="0 0 24 24">
                            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                        </svg>
                        <span class="text-sm font-medium text-gray-700">Facebook</span>
                    </button>
                </div>

                <p class="text-center text-sm text-gray-600">
                    Pas encore de compte?
                    <button onclick="showRegister()" class="text-purple-600 hover:text-purple-700 font-semibold">S'inscrire</button>
                </p>
            </div>

            <!-- Register Form -->
            <div id="registerForm" class="hidden space-y-6">
                <div class="text-center">
                    <h2 class="text-3xl font-bold text-gray-800">Créer un compte</h2>
                    <p class="text-gray-600 mt-2">Commencez gratuitement dès aujourd'hui</p>
                </div>

                <form class="space-y-5" action="registre" method="post" >
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Prénom</label>
                            <input type="text" name="prenom" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Ahmed">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Nom</label>
                            <input type="text" name="nom" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Bennani">
                        </div>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Adresse email</label>
                        <input type="email" name="email" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="exemple@clinique.com">
                    </div>



                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mot de passe</label>
                        <input type="password" name="mdp"  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="••••••••">
                        <p class="text-xs text-gray-500 mt-1">Au moins 8 caractères avec chiffres et lettres</p>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Confirmer le mot de passe</label>
                        <input type="password" name="Confirme_mdp"  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="••••••••">
                    </div>

                    <div class="flex items-start">
                        <input type="checkbox" required class="w-4 h-4 mt-1 text-purple-600 border-gray-300 rounded focus:ring-purple-500">
                        <span class="ml-2 text-sm text-gray-700">
                                J'accepte les <a href="#" class="text-purple-600 hover:text-purple-700 font-medium">conditions d'utilisation</a> et la <a href="#" class="text-purple-600 hover:text-purple-700 font-medium">politique de confidentialité</a>
                            </span>
                    </div>

                    <button type="submit" class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition shadow-lg">
                        Créer mon compte
                    </button>
                </form>

                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-white text-gray-500">Ou s'inscrire avec</span>
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <button class="flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
                        <svg class="w-5 h-5 mr-2" viewBox="0 0 24 24">
                            <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                            <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                            <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                            <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                        </svg>
                        <span class="text-sm font-medium text-gray-700">Google</span>
                    </button>
                    <button class="flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
                        <svg class="w-5 h-5 mr-2" fill="#1877F2" viewBox="0 0 24 24">
                            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                        </svg>
                        <span class="text-sm font-medium text-gray-700">Facebook</span>
                    </button>
                </div>

                <p class="text-center text-sm text-gray-600">
                    Déjà un compte?
                    <button onclick="showLogin()" class="text-purple-600 hover:text-purple-700 font-semibold">Se connecter</button>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20">
    <div class="text-center text-white mb-16">
        <h2 class="text-4xl font-bold mb-4">Pourquoi choisir ClinicPro ?</h2>
        <p class="text-xl text-purple-100">Tout ce dont vous avez besoin pour gérer votre clinique efficacement</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="glass-effect rounded-xl p-8 text-center hover:scale-105 transition">
            <div class="bg-purple-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="h-8 w-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Gestion des Patients</h3>
            <p class="text-gray-600">Dossiers médicaux électroniques complets et sécurisés</p>
        </div>

        <div class="glass-effect rounded-xl p-8 text-center hover:scale-105 transition">
            <div class="bg-purple-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="h-8 w-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Rendez-vous</h3>
            <p class="text-gray-600">Planification intelligente et rappels automatiques</p>
        </div>

        <div class="glass-effect rounded-xl p-8 text-center hover:scale-105 transition">
            <div class="bg-purple-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="h-8 w-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Rapports & Analyses</h3>
            <p class="text-gray-600">Tableaux de bord et statistiques en temps réel</p>
        </div>
    </div>
</div>

<script>
    function showLogin() {
        document.getElementById('loginForm').classList.remove('hidden');
        document.getElementById('registerForm').classList.add('hidden');
    }

    function showRegister() {
        document.getElementById('loginForm').classList.add('hidden');
        document.getElementById('registerForm').classList.remove('hidden');
    }

    function toggleMobileMenu() {
        document.getElementById('mobileMenu').classList.toggle('hidden');
    }

    function handleLogin(event) {
        event.preventDefault();
        alert('Connexion réussie! Redirection vers le tableau de bord...');
        // Ici vous pouvez ajouter votre logique de connexion
    }

    function handleRegister(event) {
        event.preventDefault();
        alert('Compte créé avec succès! Vérifiez votre email pour confirmer.');
        // Ici vous pouvez ajouter votre logique d'inscription
    }
</script>
</body>
</html>