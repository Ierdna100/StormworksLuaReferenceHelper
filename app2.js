const fs = require('fs')

const all = {
    addon: fs.readFileSync("./ref/addon.lua").toString(),
    ai: fs.readFileSync("./ref/ai.lua").toString(),
    callbacks: fs.readFileSync("./ref/callbacks.lua").toString(),
    game: fs.readFileSync("./ref/game.lua").toString(),
    matrices: fs.readFileSync("./ref/matrices.lua").toString(),
    misc: fs.readFileSync("./ref/misc.lua").toString(),
    objects: fs.readFileSync("./ref/objects.lua").toString(),
    ui: fs.readFileSync("./ref/ui.lua").toString(),
    vehicles: fs.readFileSync("./ref/vehicles.lua").toString()
}

const final = []
for (const key in all) {
    const coll = all[key]
    for (const line of coll.split("\r\n")) {
        if (line[0] != "-" && line.includes("function")) {
            final.push(line)
        }
    }
}

const allFinal = {
    matrix: [],
    property: [],
    server: []
}

for (const func of final) {
    let largerCategory = func.split(" ")[1].split(".")[0]
    if (largerCategory != "server" && largerCategory != "matrix" && largerCategory != "property") {
        continue
    }
    let func2 = func.split(" ")[1].split(".")[1]
    let func3 = func2.split("(")[0]
    allFinal[largerCategory].push(func3)
}

for (const key in allFinal) {
    console.log(`${key}: ${allFinal[key].length}`)
}

const desiredKey = "server"
const desired = JSON.parse(fs.readFileSync(`./output/${desiredKey}.json`)).table

const missing = []
for (const desiredFunc in desired) {
    let found = false
    for (const key in allFinal[desiredKey]) {
        const value = allFinal[desiredKey][key]
        if (value == desiredFunc) {
            found = true
            break;
        }
    }

    if (!found) {
        missing.push(desiredFunc)
    }
}

console.log(missing)
console.log(missing.length)