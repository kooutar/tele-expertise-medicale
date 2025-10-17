<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClinicPro - Espace Spécialiste</title>
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
                <span class="text-white font-medium">Dr. ${sessionScope.person.nom}</span>
                <a href="${pageContext.request.contextPath}/logout" class="bg-white/20 text-white px-4 py-2 rounded-lg hover:bg-white/30 transition">Déconnexion</a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="glass-effect rounded-2xl shadow-2xl p-8">
        <div class="mb-6">
            <h2 class="text-3xl font-bold text-gray-800">Consultations du Jour!!</h2>
            <p class="text-gray-600 mt-2">Demandes d'avis spécialisé à traiter</p>
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
                                <p class="text-xs text-gray-400 mt-1">Demandé par: Dr. Généraliste</p>
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

                    </div>

                    <!-- Informations consultation -->
                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div class="bg-gray-50 rounded-lg p-3">
                            <p class="text-xs text-gray-500 uppercase font-medium mb-1">Date RDV</p>
                            <p class="text-sm font-semibold text-purple-600">c.creneaux.date</p>
                        </div>
                        <div class="bg-gray-50 rounded-lg p-3">
                            <p class="text-xs text-gray-500 uppercase font-medium mb-1">Heure RDV</p>
                            <p class="text-sm font-semibold text-purple-600">c.creneaux.heure</p>
                        </div>
                    </div>

                    <!-- Raison de la demande -->

                    <!-- Actions -->
                    <div class="flex items-center justify-end pt-4 border-t border-gray-100">
                        <button onclick="openAvisModal(${c.id}, '${c.patient.nom}')"
                                class="flex items-center space-x-2 bg-gradient-to-r from-purple-600 to-indigo-600 text-white px-4 py-2 rounded-lg font-medium hover:from-purple-700 hover:to-indigo-700 transition">
                            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                            </svg>
                            <span>Donner mon Avis</span>
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Modal Avis Spécialiste -->
<div id="avisModal" class="modal">
    <div class="glass-effect rounded-2xl shadow-2xl max-w-2xl w-full mx-4">
        <div class="bg-gradient-to-r from-purple-600 to-indigo-600 p-6 rounded-t-2xl">
            <div class="flex items-center justify-between">
                <div>
                    <h3 class="text-2xl font-bold text-white">Avis Spécialisé</h3>
                    <p id="modalPatientName" class="text-purple-100 text-sm mt-1"></p>
                </div>
                <button onclick="closeAvisModal()" class="text-white hover:text-gray-200">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
        </div>
        <form id="avisForm" class="p-6 space-y-4">
            <input type="hidden" id="consultationId" name="consultationId">

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Diagnostic Spécialisé</label>
                <input type="text" name="diagnostic" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition"
                       placeholder="Entrez le diagnostic">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Observation</label>
                <textarea name="observation" rows="4" required
                          class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition"
                          placeholder="Vos observations détaillées concernant le patient..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Prescription</label>
                <textarea name="prescription" rows="4"
                          class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition"
                          placeholder="Médicaments prescrits et posologie..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Recommandations</label>
                <textarea name="recommandations" rows="3"
                          class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition"
                          placeholder="Recommandations pour le patient..."></textarea>
            </div>

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-3 rounded-lg font-semibold hover:from-purple-700 hover:to-indigo-700 transition">
                    Enregistrer l'avis
                </button>
                <button type="button" onclick="closeAvisModal()"
                        class="px-6 bg-gray-200 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-300 transition">
                    Annuler
                </button>
            </div>
        </form>
    </div>
</div>

<script>
function openAvisModal(consultationId, patientNom) {
    const modal = document.getElementById('avisModal');
    document.getElementById('consultationId').value = consultationId;
    document.getElementById('modalPatientName').textContent = 'Patient: ' + patientNom;
    modal.classList.add('active');
}

function closeAvisModal() {
    document.getElementById('avisModal').classList.remove('active');
    document.getElementById('avisForm').reset();
}

// Gestion de la soumission du formulaire
document.getElementById('avisForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this);
    const ctx = "${pageContext.request.contextPath}";

    // Convertir FormData en URLSearchParams pour envoyer en x-www-form-urlencoded
    const params = new URLSearchParams();
    for (const pair of formData.entries()) {
        params.append(pair[0], pair[1]);
    }

    fetch(ctx + "/AvisSpecialisteServlet", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString()
    })
    .then(response => {
        if (response.ok) {
            alert('Avis enregistré avec succès!');
            closeAvisModal();
            location.reload();
        } else {
            alert('Erreur lors de l\'enregistrement');
        }
    })
    .catch(error => {
        console.error('Erreur:', error);
        alert('Erreur lors de l\'enregistrement');
    });
});

// Fermer le modal en cliquant à l'extérieur
window.onclick = function(event) {
    const avisModal = document.getElementById('avisModal');
    if (event.target === avisModal) {
        closeAvisModal();
    }
}
</script>
</body>
</html>