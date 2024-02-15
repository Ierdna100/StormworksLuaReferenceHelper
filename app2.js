const fs = require('fs')

function getFunctionsFromFiles(files) {
    const final = []
    for (const key in files) {
        const coll = files[key]
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

    return allFinal
}

function getMissingFromKey(functions, desiredKey) {
    const desired = JSON.parse(fs.readFileSync(`./output/${desiredKey}.json`)).table

    const missing = []
    for (const desiredFunc in desired) {
        let found = false
        for (const key in functions[desiredKey]) {
            const value = functions[desiredKey][key]
            if (value == desiredFunc) {
                found = true
                break;
            }
        }

        if (!found) {
            missing.push(desiredFunc)
        }
    }

    return missing
}

function getFiles() {
    return all = {
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
}

function main() {
    let functions = getFunctionsFromFiles(getFiles())
    for (const key in functions) {
        console.log(`${key}: ${functions[key].length}`)
    }

    let missing = {
        server: getMissingFromKey(functions, "server"),
        property: getMissingFromKey(functions, "property"),
        matrix: getMissingFromKey(functions, "matrix")
    }

    fs.writeFileSync("./output2.json", JSON.stringify(missing, null, "\t"))
}

main()