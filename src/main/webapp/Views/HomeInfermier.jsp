
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClinicPro - Espace Infirmière</title>
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
                <a href="#" class="text-white hover:text-purple-200 transition">Tableau de bord</a>
                <a href="#" class="text-white hover:text-purple-200 transition">Patients</a>
                <a href="#" class="text-white hover:text-purple-200 transition">Consultations</a>
            </div>
            <div class="flex items-center space-x-4">
                <span class="text-white font-medium"> ${sessionScope.person.nom}</span>
                <a href="${pageContext.request.contextPath}/logout" class="bg-white/20 text-white px-4 py-2 rounded-lg hover:bg-white/30 transition">Déconnexion</a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">

    <div class="glass-effect rounded-2xl shadow-2xl p-8">
        <div class="mb-6">
            <h2 class="text-3xl font-bold text-gray-800">Enregistrer un Patient</h2>
            <p class="text-gray-600 mt-2">Ajouter un nouveau patient au système</p>
        </div>

        <form id="patientForm" method="post" action="${pageContext.request.contextPath}/patient" class="space-y-5">
            <!-- Informations de base -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Nom</label>
                <input type="text" name="nom" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Nom du patient">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Prénom</label>
                <input type="text" name="prenom" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Prénom du patient">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                <input type="email" name="email" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="email@exemple.com">
            </div>

            <!-- Rendez-vous -->
            <div class="border-t pt-5 mt-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Planifier un Rendez-vous</h3>

                <div class="space-y-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Date du rendez-vous</label>
                            <input type="date" name="date_rendez_vous" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Heure</label>
                            <input type="time" name="heure_rendez_vous" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Signes Vitaux -->
            <div class="border-t pt-5 mt-6">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Mesure des Signes Vitaux</h3>

                <div class="space-y-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Tension artérielle (mmHg)</label>
                            <input type="text" name="tension" placeholder="120/80" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Fréquence cardiaque (bpm)</label>
                            <input type="number" name="frequence_cardiaque" placeholder="75" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Température (°C)</label>
                            <input type="number" step="0.1" name="temperature" placeholder="37.0" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Fréquence respiratoire (rpm)</label>
                            <input type="number" name="frequence_respiratoire" placeholder="16" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Poids (kg)</label>
                            <input type="number" step="0.1" name="poids" placeholder="70.5" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Taille (cm)</label>
                            <input type="number" name="taille" placeholder="175" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition shadow-lg">
                Enregistrer le Patient
            </button>
        </form>
    </div>

        <!-- Liste des patients en consultation -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8">
            <div class="mb-6">
                <h2 class="text-3xl font-bold text-gray-800">Patients en Consultation</h2>
                <p class="text-gray-600 mt-2">Consultations actives du jour</p>
            </div>

            <div id="patientsList" class="space-y-4 max-h-[600px] overflow-y-auto">
                <!-- Les patients seront ajoutés dynamiquement ici -->
                <c:forEach var="c" items="${consultationsCourantes}">
                   <div class="patient-card bg-white rounded-xl p-5 border border-gray-200 shadow-sm">
                            <div class="flex items-start justify-between mb-3">
                                <div class="flex items-center space-x-3">
                                    <div class="bg-gradient-to-br from-purple-500 to-indigo-600 rounded-full p-3">
                                        <svg class="h-6 w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="text-lg font-bold text-gray-800">${c.patient.nom}</h3>
                                        <p class="text-sm text-gray-500">ID: #${c.id}</p>
                                    </div>
                                </div>
                                <span class="status-badge bg-green-100 text-green-700 text-xs font-semibold px-3 py-1 rounded-full">
                                    ${c.status}
                                </span>
                            </div>

                            <div class="grid grid-cols-2 gap-4 mt-4">
                                <div class="bg-gray-50 rounded-lg p-3">
                                    <p class="text-xs text-gray-500 uppercase font-medium mb-1">Médecin</p>
                                    <p class="text-sm font-semibold text-gray-800">Dr. Alami</p>
                                </div>
                                <div class="bg-gray-50 rounded-lg p-3">
                                    <p class="text-xs text-gray-500 uppercase font-medium mb-1">Montant</p>
                                    <p class="text-sm font-semibold text-purple-600">${c.mountant}  DH</p>
                                </div>
                            </div>

                            <div class="mt-4 pt-4 border-t border-gray-100 flex items-center justify-between">
                                <div class="flex items-center text-sm text-gray-500">
                                    <svg class="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                    </svg>
                                    ${c.dateConsultation}
                                </div>
                                <button class="text-purple-600 hover:text-purple-800 text-sm font-medium transition">
                                    Voir détails →
                                </button>
                            </div>
                        </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
