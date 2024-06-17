let allData = [];

        async function fetchData() {
            const url = 'https://www.datos.gov.co/resource/9vha-vh9n.json';
            const response = await fetch(url);
            const data = await response.json();
            allData = data;
            populateSelects(data);
            displayData(data);
        }

        function populateSelects(data) {
            const departamentos = [...new Set(data.map(item => item.departamento).filter(Boolean))];
            const departamentoSelect = document.getElementById('departamento');
            departamentoSelect.innerHTML = '<option value="">Seleccione Departamento</option>';
            departamentos.forEach(dep => {
                const option = document.createElement('option');
                option.value = dep;
                option.textContent = dep;
                departamentoSelect.appendChild(option);
            });
        }

        document.getElementById('departamento').addEventListener('change', function() {
            const selectedDep = this.value;
            const municipios = [...new Set(allData
                .filter(item => item.departamento === selectedDep)
                .map(item => item.municipio)
                .filter(Boolean))];
            const municipioSelect = document.getElementById('municipio');
            municipioSelect.innerHTML = '<option value="">Seleccione Municipio</option>';
            municipios.forEach(mun => {
                const option = document.createElement('option');
                option.value = mun;
                option.textContent = mun;
                municipioSelect.appendChild(option);
            });
        });

        function groupData(data) {
            const grouped = {};
            data.forEach(item => {
                const key = `${item.departamento}-${item.municipio}`;
                if (!grouped[key]) {
                    grouped[key] = { ...item, cantidad: 0 };
                }
                grouped[key].cantidad += parseInt(item.cantidad) || 1;
            });
            return Object.values(grouped);
        }

        function displayData(data) {
            const groupedData = groupData(data);
            const tableBody = document.getElementById('hurtoTable').getElementsByTagName('tbody')[0];
            tableBody.innerHTML = '';

            groupedData.forEach(item => {
                const row = tableBody.insertRow();
                row.insertCell(0).textContent = item.departamento || '';
                row.insertCell(1).textContent = item.municipio || '';
                row.insertCell(2).textContent = item.cantidad;
            });
        }

        function buscar() {
            const tipoDeHurto = document.getElementById('tipoHurto').value;
            const departamento = document.getElementById('departamento').value;
            const municipio = document.getElementById('municipio').value;

            const filteredData = allData.filter(item => {
                return (tipoDeHurto ? item.tipo_de_hurto === tipoDeHurto : true) &&
                       (departamento ? item.departamento === departamento : true) &&
                       (municipio ? item.municipio === municipio : true);
            });

            displayData(filteredData);
        }

        document.addEventListener('DOMContentLoaded', function() {
            fetchData();
        });