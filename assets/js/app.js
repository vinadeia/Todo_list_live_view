
import "../css/app.css"
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

liveSocket.connect()

window.liveSocket = liveSocket

const themeSwitch = document.getElementById('theme-switch')

themeSwitch.addEventListener("click", toogleTheme)

function toogleTheme(){
    let viewBody = document.querySelector('body')
    let themeBody = viewBody.classList

    if(themeBody.value == 'theme-light') {
        themeBody.remove('theme-light')
        themeBody.add('theme-dark')
    } else {
        themeBody.remove('theme-dark')
        themeBody.add('theme-light')
    }
}