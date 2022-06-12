const button = document.querySelector('#login-submit-button');
if (button) {
    button.addEventListener("click", async e => {
        let handle
        if (e.target.matches(".handle")) {
            handle = e.target
        } else {
            handle = e.target.closest(".handle")
        }
        if (handle != null) onHandleClick(handle)
    })
}

const throttleProgressBar = throttle(() => {
    document.querySelectorAll(".progress-bar").forEach(calculateProgressBar)
}, 250)
window.addEventListener("resize", throttleProgressBar)

document.querySelectorAll(".progress-bar").forEach(calculateProgressBar)

function calculateProgressBar(progressBar) {
    progressBar.innerHTML = ""
    const slider = progressBar.closest(".row").querySelector(".slider")
    const itemCount = slider.children.length
    const itemsPerScreen = parseInt(
        getComputedStyle(slider).getPropertyValue("--items-per-screen")
    )
    let sliderIndex = parseInt(
        getComputedStyle(slider).getPropertyValue("--slider-index")
    )
    const progressBarItemCount = Math.ceil(itemCount / itemsPerScreen)

    if (sliderIndex >= progressBarItemCount) {
        slider.style.setProperty("--slider-index", progressBarItemCount - 1)
        sliderIndex = progressBarItemCount - 1
    }

    for (let i = 0; i < progressBarItemCount; i++) {
        const barItem = document.createElement("div")
        barItem.classList.add("progress-item")
        if (i === sliderIndex) {
            barItem.classList.add("active")
        }
        progressBar.append(barItem)
    }
}

function onHandleClick(handle) {
    const progressBar = handle.closest(".row").querySelector(".progress-bar")
    const slider = handle.closest(".container").querySelector(".slider")
    const sliderIndex = parseInt(
        getComputedStyle(slider).getPropertyValue("--slider-index")
    )
    const progressBarItemCount = progressBar.children.length
    if (handle.classList.contains("left-handle")) {
        if (sliderIndex - 1 < 0) {
            slider.style.setProperty("--slider-index", progressBarItemCount - 1)
            progressBar.children[sliderIndex].classList.remove("active")
            progressBar.children[progressBarItemCount - 1].classList.add("active")
        } else {
            slider.style.setProperty("--slider-index", sliderIndex - 1)
            progressBar.children[sliderIndex].classList.remove("active")
            progressBar.children[sliderIndex - 1].classList.add("active")
        }
    }

    if (handle.classList.contains("right-handle")) {
        if (sliderIndex + 1 >= progressBarItemCount) {
            slider.style.setProperty("--slider-index", 0)
            progressBar.children[sliderIndex].classList.remove("active")
            progressBar.children[0].classList.add("active")
        } else {
            slider.style.setProperty("--slider-index", sliderIndex + 1)
            progressBar.children[sliderIndex].classList.remove("active")
            progressBar.children[sliderIndex + 1].classList.add("active")
        }
    }
}

function throttle(cb, delay = 1000) {
    let shouldWait = false
    let waitingArgs
    const timeoutFunc = () => {
        if (waitingArgs == null) {
            shouldWait = false
        } else {
            cb(...waitingArgs)
            waitingArgs = null
            setTimeout(timeoutFunc, delay)
        }
    }

    return (...args) => {
        if (shouldWait) {
            waitingArgs = args
            return
        }

        cb(...args)
        shouldWait = true
        setTimeout(timeoutFunc, delay)
    }
}

// function changeRegister() {
//     if (document.getElementById('email_register').checkValidity()) {
//         document.getElementById('erur').style.display = "none"
//         document.getElementById('new-text').style.display = "none"
//         document.getElementById('cnt-btn').style.display = "none"
//         document.getElementById('after1').style.display = "block"
//         document.getElementById('after2').style.display = "block"
//         document.getElementById('after3').style.display = "block"
//         document.getElementById('after4').style.display = "block"
//         document.getElementById('after5').style.display = "block"
//         document.getElementById('after6').style.display = "block"
//         document.getElementById('after7').style.display = "block"
//         document.getElementById('after8').style.display = "block"
//         document.getElementById('after9').style.display = "block"
//     }
// }

function new_func(num) {
    if (num == 1) {
        document.getElementById('my-profile-div').style.display = "flex";
        document.getElementById('my-addresses-div').style.display = "none";
        document.getElementById('my-orders-div').style.display = "none";
        document.getElementById('my-favorites-div').style.display = "none";
        document.getElementById('prof-btn').style.fontWeight = "bold";
        document.getElementById('addr-btn').style.fontWeight = "normal";
        document.getElementById('order-btn').style.fontWeight = "normal";
        document.getElementById('fav-btn').style.fontWeight = "normal";
    }
    else if (num == 2) {
        document.getElementById('my-profile-div').style.display = "none";
        document.getElementById('my-addresses-div').style.display = "flex";
        document.getElementById('my-orders-div').style.display = "none";
        document.getElementById('my-favorites-div').style.display = "none";
        document.getElementById('prof-btn').style.fontWeight = "normal";
        document.getElementById('addr-btn').style.fontWeight = "bold";
        document.getElementById('order-btn').style.fontWeight = "normal";
        document.getElementById('fav-btn').style.fontWeight = "normal";
    }
    else if (num == 3) {
        document.getElementById('my-profile-div').style.display = "none";
        document.getElementById('my-addresses-div').style.display = "none";
        document.getElementById('my-orders-div').style.display = "flex";
        document.getElementById('my-favorites-div').style.display = "none";
        document.getElementById('prof-btn').style.fontWeight = "normal";
        document.getElementById('addr-btn').style.fontWeight = "normal";
        document.getElementById('order-btn').style.fontWeight = "bold";
        document.getElementById('fav-btn').style.fontWeight = "normal";
    }
    else if (num == 4) {
        document.getElementById('my-profile-div').style.display = "none";
        document.getElementById('my-addresses-div').style.display = "none";
        document.getElementById('my-orders-div').style.display = "none";
        document.getElementById('my-favorites-div').style.display = "flex";
        document.getElementById('prof-btn').style.fontWeight = "normal";
        document.getElementById('addr-btn').style.fontWeight = "normal";
        document.getElementById('order-btn').style.fontWeight = "normal";
        document.getElementById('fav-btn').style.fontWeight = "bold";
    }
}