<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClinicPro - Espace Généraliste</title>
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
        .modal {
            display: none;
            position: fixed;
            z-index: 50;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .creneau-card {
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .creneau-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .creneau-card.selected {
            border: 2px solid #7c3aed;
            background: #f3e8ff;
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
                <a href="#" class="text-white hover:text-purple-200 transition">Mes Consultations</a>
                <a href="#" class="text-white hover:text-purple-200 transition">Patients</a>
            </div>
            <div class="flex items-center space-x-4">
                <span class="text-white font-medium">Dr. Généraliste</span>
                <button class="bg-white/20 text-white px-4 py-2 rounded-lg hover:bg-white/30 transition">Déconnexion</button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="glass-effect rounded-2xl shadow-2xl p-8">
        <div class="mb-6">
            <h2 class="text-3xl font-bold text-gray-800">Consultations du Jour</h2>
            <p class="text-gray-600 mt-2">Gérez vos consultations et dossiers médicaux</p>
        </div>

        <!-- Liste des consultations scrollable -->
        <div class="space-y-4 max-h-[700px] overflow-y-auto pr-2">
            <c:forEach var="c" items="${consultationsJour}">
                <div class="bg-white rounded-xl p-6 border border-gray-200 shadow-sm hover:shadow-md transition">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-center space-x-4">
                            <div class="bg-gradient-to-br from-purple-500 to-indigo-600 rounded-full p-3">
                                <svg class="h-7 w-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <div>
                                <h3 class="text-xl font-bold text-gray-800">${c.patient.nom}</h3>
                                <p class="text-sm text-gray-500">Consultation #${c.id} - ${c.dateConsultation}</p>
                            </div>
                        </div>
                        <span class="bg-blue-100 text-blue-700 text-xs font-semibold px-3 py-1 rounded-full">
                            ${c.status}
                        </span>
                    </div>

                    <!-- Informations patient -->
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div class="bg-gray-50 rounded-lg p-3">
                            <p class="text-xs text-gray-500 uppercase font-medium mb-1">Email</p>
                            <p class="text-sm font-semibold text-gray-800">${c.patient.email}</p>
                        </div>

                        <div class="bg-gray-50 rounded-lg p-3">
                            <p class="text-xs text-gray-500 uppercase font-medium mb-1">Montant</p>
                            <p class="text-sm font-semibold text-purple-600">${c.mountant} DH</p>
                        </div>
                    </div>

                    <!-- Signes vitaux -->
                    <div class="bg-gradient-to-r from-purple-50 to-indigo-50 rounded-lg p-4 mb-4">
                        <h4 class="text-sm font-bold text-gray-700 mb-3 flex items-center">
                            <svg class="h-4 w-4 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
                            </svg>
                            Signes Vitaux
                        </h4>
                        <div class="grid grid-cols-3 gap-3">

                       </div>

                    </div>

                    <!-- Actions -->
                    <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                        <button onclick="openDossier(${c.patient.id})" class="flex items-center space-x-2 bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-4 py-2 rounded-lg font-medium hover:from-purple-700 hover:to-indigo-700 transition">
                            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                            </svg>
                            <span>Dossier Médical</span>
                        </button>

                        <div class="flex items-center space-x-3">
                            <select onchange="updateStatus(${c.id}, this.value)"
                                    class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition">
                                   <option value="ENATTENTE">En attente </option>
                                    <option value="TERMINEE" ${c.status == 'TERMINEE' ? 'selected' : ''}>
                                        Terminé
                                    </option>
                            </select>

                            <button onclick="openSpecialisteModal(${c.id})" class="flex items-center space-x-2 bg-gradient-to-r from-emerald-500 to-teal-600 text-white px-4 py-2 rounded-lg font-medium hover:from-emerald-600 hover:to-teal-700 transition">
                                <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                                </svg>
                                <span>Avis Spécialiste</span>
                            </button>

                            <button onclick="openAvis(${c.id})" class="flex items-center space-x-2 bg-white border-2 border-purple-600 text-purple-600 px-4 py-2 rounded-lg font-medium hover:bg-purple-50 transition">
                                <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                </svg>
                                <span>Avis Médical</span>
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Modal Dossier Médical -->
<div id="dossierModal" class="modal">
    <div class="glass-effect rounded-2xl shadow-2xl max-w-4xl w-full mx-4 max-h-[90vh] overflow-y-auto">
        <div class="bg-gradient-to-r from-purple-600 to-indigo-600 p-6 rounded-t-2xl">
            <div class="flex items-center justify-between">
                <h3 class="text-2xl font-bold text-white">Dossier Médical</h3>
                <button onclick="closeDossier()" class="text-white hover:text-gray-200">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div id="dossierContent" class="p-6">
            <!-- Le contenu sera chargé dynamiquement -->
        </div>
    </div>
</div>

<!-- Modal Avis Médical -->
<div id="avisModal" class="modal">
    <div class="glass-effect rounded-2xl shadow-2xl max-w-2xl w-full mx-4">
        <div class="bg-gradient-to-r from-purple-600 to-indigo-600 p-6 rounded-t-2xl">
            <div class="flex items-center justify-between">
                <h3 class="text-2xl font-bold text-white">Avis Médical</h3>
                <button onclick="closeAvis()" class="text-white hover:text-gray-200">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
        </div>
        <form id="avisForm" class="p-6 space-y-4">
            <input type="hidden" id="consultationId" name="consultationId">

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Diagnostic</label>
                <input type="text" name="diagnostic" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Entrez le diagnostic">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Observation</label>
                <textarea name="observation" rows="4" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Vos observations concernant le patient..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Prescription</label>
                <textarea name="prescription" rows="4" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Médicaments prescrits et posologie..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Recommandations</label>
                <textarea name="recommandations" rows="3" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition" placeholder="Recommandations pour le patient..."></textarea>
            </div>

            <div class="flex space-x-3">
                <button type="submit" class="flex-1 bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition">
                    Enregistrer l'avis
                </button>
                <button type="button" onclick="closeAvis()" class="px-6 bg-gray-200 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-300 transition">
                    Annuler
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Modal Sélection Spécialiste -->
<div id="specialisteModal" class="modal">
    <div class="glass-effect rounded-2xl shadow-2xl max-w-3xl w-full mx-4 max-h-[90vh] overflow-y-auto">
        <!-- En-tête -->
        <div class="bg-gradient-to-r from-emerald-600 to-teal-600 p-6 rounded-t-2xl">
            <div class="flex items-center justify-between">
                <div>
                    <h3 class="text-2xl font-bold text-white">Demander un Avis Spécialiste</h3>
                    <p class="text-emerald-100 text-sm mt-1">Sélectionnez un spécialiste et un créneau disponible</p>
                </div>
                <button onclick="closeSpecialisteModal()" class="text-white hover:text-gray-200 transition">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Contenu -->
        <form id="specialisteForm" class="p-8" action="${pageContext.request.contextPath}/Creneaux" method="post">
            <div class="space-y-6">
                <input type="hidden" id="idConsultation" name="idConsultation">
                <!-- Sélection du spécialiste -->
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-2 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                            Choisir un spécialiste
                        </span>
                    </label>
                    <select name="specialiste" required
                            class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition text-gray-800 font-medium">
                        <option value="">-- Sélectionnez un spécialiste --</option>
                         <c:forEach var="specialist" items="${listeSpecialistes}">
                        <option value="${specialist.id}">Dr. ${specialist.nom} - ${specialist.specialiteType}</option>

                         </c:forEach>
                    </select>
                </div>

                <!-- Sélection de la date -->
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-2 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                            Choisir une date
                        </span>
                    </label>
                    <select id="dateSelect" name="date" required
                            class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition text-gray-800 font-medium">
                        <option value="">-- Sélectionnez une date --</option>



                    </select>
                </div>

                <!-- Sélection de l'heure -->
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">
                        <span class="flex items-center">
                            <svg class="h-5 w-5 mr-2 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            Choisir une heure
                        </span>
                    </label>
                    <select name="time" required
                            class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition text-gray-800 font-medium">
                        <option value="">-- Sélectionnez une heure --</option>
                        <option value="08:00">08:00</option>
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="13:00">13:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                        <option value="15:00">15:00</option>
                        <option value="15:30">15:30</option>
                        <option value="16:00">16:00</option>
                        <option value="16:30">16:30</option>
                        <option value="17:00">17:00</option>
                    </select>
                </div>

            </div>
            <button type="submit"
                                    class="bg-gradient-to-r from-emerald-600 to-teal-600 text-white px-6 py-3 rounded-lg font-semibold hover:from-emerald-700 hover:to-teal-700 transition shadow-lg hover:shadow-xl">
                                Confirmer la demande
                            </button>
        </form>

        <!-- Pied de page -->
        <div class="bg-gray-50 p-6 border-t sticky bottom-0">
            <div class="flex items-center justify-between">
                <div class="text-sm text-gray-600 font-medium">
                    Remplissez tous les champs pour continuer
                </div>

            </div>
        </div>
    </div>
</div>


<script>
let currentConsultationId = null;
let selectedSpecialisteId = null;
let selectedCreneauDate = null;
let selectedCreneauHeure = null;

function openDossier(patientId) {
    const modal = document.getElementById('dossierModal');
    modal.classList.add('active');

    // Simuler le chargement du dossier médical
    document.getElementById('dossierContent').innerHTML = `
        <div class="space-y-6">
            <div>
                <h4 class="text-lg font-bold text-gray-800 mb-3">Informations du Patient</h4>
                <div class="grid grid-cols-2 gap-4">
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-xs text-gray-500 uppercase font-medium mb-1">Nom complet</p>
                        <p class="text-sm font-semibold text-gray-800">Patient ${patientId}</p>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-xs text-gray-500 uppercase font-medium mb-1">Date de naissance</p>
                        <p class="text-sm font-semibold text-gray-800">01/01/1980</p>
                    </div>
                </div>
            </div>

            <div>
                <h4 class="text-lg font-bold text-gray-800 mb-3">Antécédents Médicaux</h4>
                <div class="bg-gray-50 rounded-lg p-4">
                    <ul class="list-disc list-inside space-y-2 text-sm text-gray-700">
                        <li>Hypertension artérielle (depuis 2020)</li>
                        <li>Diabète de type 2 (depuis 2018)</li>
                        <li>Allergies: Pénicilline</li>
                    </ul>
                </div>
            </div>

            <div>
                <h4 class="text-lg font-bold text-gray-800 mb-3">Consultations Précédentes</h4>
                <div class="space-y-3">
                    <div class="bg-white border border-gray-200 rounded-lg p-4">
                        <div class="flex justify-between items-start mb-2">
                            <span class="text-sm font-semibold text-gray-800">10/10/2025 - Consultation de suivi</span>
                            <span class="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">Terminé</span>
                        </div>
                        <p class="text-sm text-gray-600">Dr. Alami - Contrôle diabète, ajustement traitement</p>
                    </div>
                </div>
            </div>
        </div>
    `;
}

function closeDossier() {
    document.getElementById('dossierModal').classList.remove('active');
}

function openAvis(consultationId) {
    const modal = document.getElementById('avisModal');
    document.getElementById('consultationId').value = consultationId;
    modal.classList.add('active');
}

function closeAvis() {
    document.getElementById('avisModal').classList.remove('active');
    document.getElementById('avisForm').reset();
}

// Nouvelle fonction pour ouvrir le modal spécialiste
function openSpecialisteModal(consultationId) {
    currentConsultationId = consultationId;
    document.getElementById('idConsultation').value=currentConsultationId;
    const modal = document.getElementById('specialisteModal');
    modal.classList.add('active');

    // Réinitialiser la sélection
    selectedSpecialisteId = null;
    selectedCreneauDate = null;
    selectedCreneauHeure = null;
    document.getElementById('confirmSpecialisteBtn').disabled = true;
    document.getElementById('selectedCreneauInfo').textContent = 'Sélectionnez un créneau pour continuer';

    // Retirer toutes les sélections précédentes
    document.querySelectorAll('.creneau-card.selected').forEach(card => {
        card.classList.remove('selected');
    });
}

function closeSpecialisteModal() {
    document.getElementById('specialisteModal').classList.remove('active');
    currentConsultationId = null;
    selectedSpecialisteId = null;
    selectedCreneauDate = null;
    selectedCreneauHeure = null;
}

function selectCreneau(element, specialisteId, date, heure) {
    // Retirer la sélection précédente
    document.querySelectorAll('.creneau-card.selected').forEach(card => {
        card.classList.remove('selected');
    });

    // Ajouter la nouvelle sélection
    element.classList.add('selected');

    // Enregistrer les informations
    selectedSpecialisteId = specialisteId;
    selectedCreneauDate = date;
    selectedCreneauHeure = heure;


    document.getElementById('selectedCreneauInfo').innerHTML = `
        <strong>Sélectionné:</strong> ${specialisteNames[specialisteId]} - ${date} à ${heure}
    `;

    // Activer le bouton de confirmation
    document.getElementById('confirmSpecialisteBtn').disabled = false;
}



window.updateStatus = function(idConsultation, newStatus) {
    const ctx = "${pageContext.request.contextPath}";

    fetch(ctx + "/ConsultationServlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "idConsultation=" + encodeURIComponent(idConsultation) +
              "&status=" + encodeURIComponent(newStatus)
    })
    .then(response => {
        if (!response.ok) throw new Error("HTTP " + response.status);
        return response.text();
    })
    .then(data => {
        console.log("Réponse servlet:", data);
        alert("Statut mis à jour !");
    })
    .catch(error => {
        console.error("Erreur :", error);
        alert("Erreur lors de la mise à jour !");
    });
};

window.sendSpecialiste = function(idConsultation, idSpecialiste) {
    const ctx = "${pageContext.request.contextPath}";

    fetch(ctx + "/ConsultationServlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "idConsultation=" + encodeURIComponent(idConsultation) +
              "&status=ATTENTE_AVIS_SPECIALISTE" +
              "&idSpecialiste=" + encodeURIComponent(idSpecialiste)
    })
    .then(r => r.text())
    .then(() => {
        alert("Consultation envoyée au spécialiste !");
        document.getElementById("selectSpecialiste").classList.add("hidden");
    })
    .catch(e => alert("Erreur : " + e));
}

document.getElementById('avisForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const formData = new FormData(this);

    // Envoyer l'avis au serveur
    console.log('Envoi de l\'avis médical', Object.fromEntries(formData));
    // Implémenter l'appel AJAX ici

    closeAvis();
    alert('Avis médical enregistré avec succès!');
});

// Fermer les modals en cliquant à l'extérieur
window.onclick = function(event) {
    const dossierModal = document.getElementById('dossierModal');
    const avisModal = document.getElementById('avisModal');
    const specialisteModal = document.getElementById('specialisteModal');

    if (event.target === dossierModal) {
        closeDossier();
    }
    if (event.target === avisModal) {
        closeAvis();
    }
    if (event.target === specialisteModal) {
        closeSpecialisteModal();
    }
}


       function formatDateFR(date) {
             const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
             return date.toLocaleDateString('fr-FR', options);
         }

         const select = document.getElementById("dateSelect");
         const nbJoursAffiches = 7;
         const today = new Date();
         let joursAjoutes = 0;
         let i = 0;

         while (joursAjoutes < nbJoursAffiches) {
             const date = new Date();
             date.setDate(today.getDate() + i);
             const jour = date.getDay();

             if (jour !== 0 && jour !== 6) { // ignorer samedi/dimanche
                 const option = document.createElement("option");

                 // ✅ Valeur technique au format ISO (compatible LocalDate)
                 option.value = date.toISOString().split("T")[0]; // ex: "2025-10-15"

                 // 🏷️ Texte affiché en français
                 const dateStr = formatDateFR(date);
                 option.textContent = dateStr.charAt(0).toUpperCase() + dateStr.slice(1);

                 select.appendChild(option);
                 joursAjoutes++;
             }
             i++;
         }
</script>