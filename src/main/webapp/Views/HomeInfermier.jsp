<%--
  Created by IntelliJ IDEA.
  User: safiy
  Date: 08/10/2025
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <span class="text-white font-medium">Infirmière</span>
                <button class="bg-white/20 text-white px-4 py-2 rounded-lg hover:bg-white/30 transition">Déconnexion</button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">

        <!-- Formulaire d'enregistrement patient -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8">
            <div class="mb-6">
                <h2 class="text-3xl font-bold text-gray-800">Enregistrer un Patient</h2>
                <p class="text-gray-600 mt-2">Ajouter un nouveau patient au système</p>
            </div>

            <form id="patientForm" class="space-y-5">
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
            </div>

            <div id="emptyState" class="text-center py-12">
                <svg class="h-24 w-24 text-gray-300 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                </svg>
                <p class="text-gray-500 text-lg">Aucun patient en consultation</p>
                <p class="text-gray-400 text-sm mt-2">Les patients enregistrés apparaîtront ici</p>
            </div>
        </div>
    </div>
</div>

<script>
    let patients = [];

    document.getElementById('patientForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(e.target);
        const patient = {
            id: Date.now(),
            nom: formData.get('nom'),
            prenom: formData.get('prenom'),
            email: formData.get('email'),
            signesVitaux: {
                tension: formData.get('tension'),
                frequenceCardiaque: formData.get('frequence_cardiaque'),
                temperature: formData.get('temperature'),
                frequenceRespiratoire: formData.get('frequence_respiratoire'),
                poids: formData.get('poids'),
                taille: formData.get('taille')
            },
            dateConsultation: new Date().toLocaleString('fr-FR')
        };

        patients.push(patient);
        displayPatients();
        e.target.reset();

        // Animation de succès
        showNotification('Patient enregistré avec succès!');
    });

    function displayPatients() {
        const patientsList = document.getElementById('patientsList');
        const emptyState = document.getElementById('emptyState');

        if (patients.length === 0) {
            patientsList.innerHTML = '';
            emptyState.classList.remove('hidden');
            return;
        }

        emptyState.classList.add('hidden');

        patientsList.innerHTML = patients.map(patient => `
            <div class="bg-white rounded-lg p-6 shadow-md border border-gray-200 hover:shadow-lg transition">
                <div class="flex justify-between items-start mb-4">
                    <div>
                        <h3 class="text-xl font-bold text-gray-800">${patient.prenom} ${patient.nom}</h3>
                        <p class="text-sm text-gray-500">${patient.email}</p>
                        <p class="text-xs text-gray-400 mt-1">
                            <svg class="inline h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            ${patient.dateConsultation}
                        </p>
                    </div>
                    <span class="bg-green-100 text-green-800 text-xs font-semibold px-3 py-1 rounded-full">En consultation</span>
                </div>

                <div class="border-t pt-4">
                    <h4 class="font-semibold text-gray-700 mb-3 flex items-center">
                        <svg class="h-5 w-5 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                        Signes Vitaux
                    </h4>
                    <div class="grid grid-cols-2 gap-3 text-sm">
                        ${patient.signesVitaux.tension ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">Tension:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.tension}</span>
                            </div>
                        ` : ''}
                        ${patient.signesVitaux.frequenceCardiaque ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">FC:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.frequenceCardiaque} bpm</span>
                            </div>
                        ` : ''}
                        ${patient.signesVitaux.temperature ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">Temp:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.temperature}°C</span>
                            </div>
                        ` : ''}
                        ${patient.signesVitaux.frequenceRespiratoire ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">FR:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.frequenceRespiratoire} rpm</span>
                            </div>
                        ` : ''}
                        ${patient.signesVitaux.poids ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">Poids:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.poids} kg</span>
                            </div>
                        ` : ''}
                        ${patient.signesVitaux.taille ? `
                            <div class="bg-gray-50 p-2 rounded">
                                <span class="text-gray-500">Taille:</span>
                                <span class="font-semibold text-gray-800 ml-1">${patient.signesVitaux.taille} cm</span>
                            </div>
                        ` : ''}
                    </div>
                </div>

                <div class="mt-4 flex gap-2">
                    <button onclick="viewDetails(${patient.id})" class="flex-1 bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 transition text-sm font-medium">
                        Voir détails
                    </button>
                    <button onclick="removePatient(${patient.id})" class="bg-red-100 text-red-600 px-4 py-2 rounded-lg hover:bg-red-200 transition text-sm font-medium">
                        Terminer
                    </button>
                </div>
            </div>
        `).join('');
    }

    function viewDetails(id) {
        const patient = patients.find(p => p.id === id);
        alert(`Détails du patient:\n\nNom: ${patient.prenom} ${patient.nom}\nEmail: ${patient.email}\n\nSignes vitaux enregistrés avec succès.`);
    }

    function removePatient(id) {
        if (confirm('Voulez-vous terminer cette consultation?')) {
            patients = patients.filter(p => p.id !== id);
            displayPatients();
            showNotification('Consultation terminée');
        }
    }

    function showNotification(message) {
        const notification = document.createElement('div');
        notification.className = 'fixed top-4 right-4 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg z-50 animate-fade-in';
        notification.innerHTML = `
            <div class="flex items-center">
                <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
                ${message}
            </div>
        `;
        document.body.appendChild(notification);
        setTimeout(() => notification.remove(), 3000);
    }

    // Initialisation
    displayPatients();
</script>
</body>
</html>
