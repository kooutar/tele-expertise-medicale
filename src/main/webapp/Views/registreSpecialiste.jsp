
<%--
  Created by IntelliJ IDEA.
  User: safiy
  Date: 08/10/2025
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.monapp.enums.SpecialiteType" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription Spécialiste - ClinicPro</title>
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
        </div>
    </div>
</nav>

<!-- Registration Form -->
<div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="glass-effect rounded-2xl shadow-2xl p-8 lg:p-10">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold text-gray-800">Inscription Spécialiste</h2>
            <p class="text-gray-600 mt-2">Rejoignez notre réseau de professionnels de santé</p>
        </div>

        <form class="space-y-5" action="specialiste" method="post">
            <!-- Nom et Prénom -->
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

            <!-- Email -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Adresse email</label>
                <input type="email" name="email" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="exemple@clinique.com">
            </div>



            <!-- Spécialité -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Spécialité médicale</label>
               <%-- <select name="specialite" required
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition bg-white">


                    <c:forEach var="specialite" items="${specialites}">
                        <option value="${specialite}">${specialite.libelle}</option>
                    </c:forEach>
                </select>--%>
                <select name="specialite" required  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition bg-white">
                    <option value="">-- Choisissez --</option>
                    <%
                        SpecialiteType[] specialites = (SpecialiteType[]) request.getAttribute("specialites");
                        if (specialites != null) {
                            for(SpecialiteType spec : specialites) {
                    %>
                    <option value="<%= spec.name() %>"><%= spec.getLibelle() %></option>
                    <%
                            }
                        }
                    %>
                </select>

            </div>

            <!-- Tarif de consultation -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Tarif de consultation (MAD)</label>
                <div class="relative">
                    <input type="number" name="tarif" required min="0" step="50" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition pl-4 pr-16" placeholder="300">
                    <span class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">MAD</span>
                </div>
                <p class="text-xs text-gray-500 mt-1">Indiquez votre tarif de consultation standard</p>
            </div>




            <!-- Mot de passe -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Mot de passe</label>
                <input type="password" name="mdp" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="••••••••">
                <p class="text-xs text-gray-500 mt-1">Au moins 8 caractères avec chiffres et lettres</p>
            </div>

            <!-- Confirmer mot de passe -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Confirmer le mot de passe</label>
                <input type="password" name="confirme_mdp" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="••••••••">
            </div>

            <!-- Conditions -->
            <div class="flex items-start">
                <input type="checkbox" required class="w-4 h-4 mt-1 text-purple-600 border-gray-300 rounded focus:ring-purple-500">
                <span class="ml-2 text-sm text-gray-700">
                    J'accepte les <a href="#" class="text-purple-600 hover:text-purple-700 font-medium">conditions d'utilisation</a> et la <a href="#" class="text-purple-600 hover:text-purple-700 font-medium">politique de confidentialité</a>
                </span>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition shadow-lg">
                Créer mon compte spécialiste
            </button>
        </form>

        <!-- Divider -->
        <div class="relative my-6">
            <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t border-gray-300"></div>
            </div>
            <div class="relative flex justify-center text-sm">
                <span class="px-2 bg-white text-gray-500">Ou s'inscrire avec</span>
            </div>
        </div>

        <!-- Social Login -->
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

        <p class="text-center text-sm text-gray-600 mt-6">
            Déjà un compte?
            <a href="#" class="text-purple-600 hover:text-purple-700 font-semibold">Se connecter</a>
        </p>
    </div>
</div>

</body>
</html>