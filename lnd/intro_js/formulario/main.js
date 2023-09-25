window.onload = () => {
    postData()
}

function postData() {
    document.querySelector('form').addEventListener('submit', e => {
        e.preventDefault()
        let name = document.getElementById('nombre')
        if (name.value.length < 6) alert('Name has to be at least 6 characters long!')
        // const data = Object.fromEntries(new FormData(e.target))
        // console.log(JSON.stringify(data))
    })
}

