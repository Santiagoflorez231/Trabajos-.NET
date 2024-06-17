const apiBaseUrl = "http://localhost:5182/api/Pagos";
const externalApiUrl = "https://www.datos.gov.co/resource/7gj8-j6i3.json";

document.addEventListener("DOMContentLoaded", () => {
  const peajeForm = document.getElementById("peajeForm");
  const nombrePeajeSelect = document.getElementById("nombrePeaje");
  const idCategoriaTarifaSelect = document.getElementById("idCategoriaTarifa");
  const valorInput = document.getElementById("valor");
  const pagosTableBody = document
    .getElementById("pagosTable")
    .querySelector("tbody");

  const fetchPeajes = async () => {
    try {
      const response = await fetch(externalApiUrl);
      const data = await response.json();
      const peajes = [...new Set(data.map((item) => item.peaje))]; // Filtra nombres únicos de peaje
      nombrePeajeSelect.innerHTML = peajes
        .map((peaje) => `<option value="${peaje}">${peaje}</option>`)
        .join("");
    } catch (error) {
      console.error("Error fetching peajes:", error);
    }
  };

  const fetchValor = async (nombrePeaje, idCategoriaTarifa) => {
    try {
      const response = await fetch(
        `${externalApiUrl}?peaje=${encodeURIComponent(
          nombrePeaje
        )}&idcategoriatarifa=${encodeURIComponent(idCategoriaTarifa)}`
      );
      const data = await response.json();
      if (data.length > 0) {
        valorInput.value = data[0].valor;
      } else {
        valorInput.value = "";
      }
    } catch (error) {
      console.error("Error fetching valor:", error);
    }
  };

  const fetchPagos = async () => {
    try {
      const response = await fetch(apiBaseUrl);
      const pagos = await response.json();
      pagosTableBody.innerHTML = pagos
  .map(
    (pago) => `
      <tr class="bg-white border-b hover:bg-gray-100">
  <td class="py-3 px-6 text-left whitespace-nowrap">${pago.placa}</td>
  <td class="py-3 px-6 text-left">${pago.nombrePeaje}</td>
  <td class="py-3 px-6 text-center">${pago.idCategoriaTarifa}</td>
  <td class="py-3 px-6 text-center">${new Date(pago.fechaRegistro).toLocaleString()}</td>
  <td class="py-3 px-6 text-right">${pago.valor}</td>
  <td class="py-3 px-6 text-right">
    <button class="inline-block text-sm bg-yellow-500 text-white rounded-full px-4 py-2 leading-none border shadow hover:bg-yellow-600" data-id="${pago.id}">Editar</button>
    <button class="inline-block text-sm bg-red-500 text-white rounded-full px-4 py-2 leading-none border shadow hover:bg-red-600 ml-2" data-id="${pago.id}">Eliminar</button>
  </td>
</tr>`
  )
  .join("");

      // Agregar EventListeners después de llenar la tabla
      document.querySelectorAll(".bg-yellow-500").forEach((btn) => {
        btn.addEventListener("click", () => {
          const pagoid = btn.dataset.id;
          editPago(pagoid);
        });
      });

      document.querySelectorAll(".bg-red-500").forEach((btn) => {
        btn.addEventListener("click", () => {
          const pagoId = btn.dataset.id;
          deletePago(pagoId);
        });
      });
    } catch (error) {
      console.error("Error fetching pagos:", error);
    }
  };




  const savePago = async (pago) => {
    try {
      if (!pago.Id) {
        delete pago.Id;
      }

      const url = pago.Id ? `${apiBaseUrl}/${pago.Id}` : apiBaseUrl;
      const method = pago.Id ? "PUT" : "POST";

      const response = await fetch(url, {
        method: method,
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(pago),
      });

      if (response.ok) {
        await fetchPagos();
        peajeForm.reset();
        delete peajeForm.dataset.id;
      } else {
        const errorText = await response.text();
        console.error("Error saving pago:", response.statusText, errorText);
      }
    } catch (error) {
      console.error("Error saving pago:", error);
    }
  };


  window.editPago = async (Id) => {
    try {
      const response = await fetch(`${apiBaseUrl}/${Id}`);
      const pago = await response.json();
      document.getElementById("placa").value = pago.placa;
      nombrePeajeSelect.value = pago.nombrePeaje;
      idCategoriaTarifaSelect.value = pago.idCategoriaTarifa;
      valorInput.value = pago.valor;
      document.getElementById("fechaRegistro").value = new Date(
        pago.fechaRegistro
      )
        .toISOString()
        .slice(0, 16);
      peajeForm.dataset.id = pago.id;
    } catch (error) {
      console.error("Error fetching pago:", error);
    }
  };



  const deletePago = async (Id) => {
    try {
      const response = await fetch(`${apiBaseUrl}/${Id}`, { method: "DELETE" });
      if (response.ok) {
        await fetchPagos(); // Actualiza la tabla de pagos después de eliminar
      } else {
        console.error("Error deleting pago:", response.statusText);
      }
    } catch (error) {
      console.error("Error deleting pago:", error);
    }
  };




  peajeForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const pago = {
      Id: peajeForm.dataset.id || null,
      Placa: document.getElementById("placa").value,
      NombrePeaje: nombrePeajeSelect.value,
      IdCategoriaTarifa: idCategoriaTarifaSelect.value,
      FechaRegistro: new Date(
        document.getElementById("fechaRegistro").value
      ).toISOString(),
      Valor: parseFloat(valorInput.value),
    };
    savePago(pago);
  });

  nombrePeajeSelect.addEventListener("change", () => {
    if (idCategoriaTarifaSelect.value) {
      fetchValor(nombrePeajeSelect.value, idCategoriaTarifaSelect.value);
    }
  });

  idCategoriaTarifaSelect.addEventListener("change", () => {
    if (nombrePeajeSelect.value) {
      fetchValor(nombrePeajeSelect.value, idCategoriaTarifaSelect.value);
    }
  });

  fetchPeajes();
  fetchPagos();
});
