const path = require("path");
const dtoJson = require('./main/resources/dto.json')
module.exports = {
    params: function ({args}) {
        if (!args.name) {
            args.name = "exmaple";
        }

        let dtoCode = this.createDtoCode(dtoJson);
        let dtoYml = this.createDtoYml(dtoJson);
        return {name: args.name, dtoCode, dtoYml};
    },
    getTypeName: function (data) {
        return Object.prototype.toString.call(data).split(' ').pop().slice(0, -1).toLocaleLowerCase();
    },
    createDtoYml(dtoJson) {
        let example = {
            "id": "example_id_001",
            "createdBy": "UNIT009",
            "createdByName": "スマート アドミン",
            "createdAt": "2021-02-18T03:13:17Z",
            "updatedBy": "UNIT009",
            "updatedByName": "スマート アドミン",
            "updatedAt": "2021-02-22T08:28:24Z",
            "permittedOps": [
                "CREATE",
                "DELETE",
                "READ",
                "UPDATE"
            ],
        };
        Object.assign(example, dtoJson);
        let dtoCompent = ``;
        for (const key in dtoJson) {
            let v = dtoJson[key];
            let typeName = this.getTypeName(v);
            dtoCompent += `
        ${key}:
          type: ${typeName}`;
        }

        return {dtoCompent, example: JSON.stringify(example, null, 5)};
    },
    createDtoCode(dtoJson) {
        let dto = ``;
        for (const key in dtoJson) {
            let v = dtoJson[key];
            let typeName = this.getTypeName(v);
            switch (typeName) {
                case 'array':
                    dto += `
    public List<String> ${key} = Lists.newArrayList();               
                `;
                    break;
                case 'string':
                    dto += `
    public String ${key} = "";                       
                `;
                    break;
                case 'boolean':
                    dto += `
    public boolean ${key} = false;               
                `;
                    break;
                case 'number':
                    dto += `
    public int ${key} = 0;               
                `;
                    break;
            }

        }

        let keys = Object.keys(dtoJson);
        let generateFieldForSearch = '';
        let lastKey = keys.pop();
        for (let key of keys) {
            generateFieldForSearch += `.append(${key}).append(" ")`
        }
        generateFieldForSearch += `.append(${lastKey});`;

        return {dto, generateFieldForSearch};
    }
}
