window.onload = function () {
    inputs = document.getElementsByTagName("input");
    for (i = 0; i < inputs.length; i++) {
        inputs[i].addEventListener("change", validateInput);
    }
}

function validateInput() {
    switch (this) {
        case inputs[0]:
            validateNome(this);
            break;
        case inputs[1]:
            validateCognome(this);
            break;
        case inputs[2]:
            validateData(this);
            break;
        case inputs[3]:
            validateCF(this);
            break;
        case inputs[4]:
            validateEmail(this);
            break;
        case inputs[5]:
            validateTel(this);
            break;
        case inputs[6]:
            validateVia(this);
            break;
        case inputs[7]:
            validateNCivico(this);
            break;
        case inputs[8]:
            validateCAP(this);
            break;
        case inputs[9]:
            validateComune(this);
            break;
        case inputs[10]:
            validateProvincia(this);
            break;
        case inputs[11]:
            validateUsername(this);
            break;
        case inputs[12]:
            validatePassword(this);
            break;
    }
}


function validateNome(elemento) {
    nomeRegex = /^[a-zA-Z]+$/;
    if (!nomeRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateCognome(elemento) {
    nomeRegex = /[a-zA-Z'\s]+/;
    if (!nomeRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateData(elemento) {
    data = elemento.value.split('-');
    if (data.length != 3 || isNaN(data[0]) || isNaN(data[1]) || isNaN(data[2])) {

        if (data[0] > 2024 || data[0] < 1900) {
            elemento.style.border = '2px solid red';
        }
        else if (data[1] > 12 || data[1] < 1) {
            elemento.style.border = '2px solid red';
        }
        else if (data[2] > 31 || data[2] < 1) {
            elemento.style.border = '2px solid red';
        }

    } else {
        elemento.style.border = '2px solid green';
    }
    console.log(data)
}

function validateCF(elemento) {
    cfRegex = /^[A-Za-z]{6}[0-9]{2}[A-Za-z][0-9]{2}[A-Za-z][0-9]{3}[A-Za-z]$/;
    if (!cfRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateEmail(elemento) {
    emailRegex = /[A-Za-z.-_!+]+[@]{1}[A-Za-z]+[.]{1}[a-zA-Z]+/;
    if (!emailRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateTel(elemento) {
    telRegex = /[0-9]{12}/;
    if (!telRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateVia(elemento) {
    viaRegex = /[a-zA-Z]+/;
    if (!viaRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateNCivico(elemento) {
    ncivicoRegex = /[0-9]+/;
    if (!ncivicoRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateCAP(elemento) {
    capRegex = /[0-9]{5}/;
    if (!capRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateComune(elemento) {
    comuneRegex = /[a-zA-Z]+/;
    if (!comuneRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateProvincia(elemento) {
    provinciaRegex = /[a-zA-Z]{2}/;
    if (!provinciaRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}

function validateUsername(elemento) {
    usernameRegex = /[a-zA-Z0-9]+/;
    if (usernameRegex.test(elemento.value) && !(elemento.value.includes(inputs[0].value.toLowerCase()) || elemento.value.includes(inputs[1].value.toLowerCase()))) {
        elemento.style.border = '2px solid green';
    } else {
        elemento.style.border = '2px solid red';
    }
}

function validatePassword(elemento) {
    passwordRegex = /.*/;
    if (!passwordRegex.test(elemento.value)) {
        elemento.style.border = '2px solid red';
    } else {
        elemento.style.border = '2px solid green';
    }
}
