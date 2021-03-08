const path = require("path");
const dtoJson = require('./main/resources/dto.json')
module.exports = {
    params: function ({args}) {
        if (!args.name) {
            args.name = "exmaple";
        }

        let dtoCode = createDtoCode(dtoJson);
        return {name: args.name, dtoCode};
    },
    getTypeName: function (data) {
        return Object.prototype.toString.call(data).split(' ').pop().slice(0, -1).toLocaleLowerCase();
    },
    createDtoCode(dtoJson) {
        let dto = ``;
        let keys = [];

        for (const key in dtoJson) {
            let v = dtoJson[key];
            keys.push(key);
            let typeName = this.getTypeName(v);
            let camelize = h.inflection.camelize(typeName, false);
            switch (typeName) {
                case 'array':
                    dto += `
                public List<String> ${key} = Lists.newArrayList();               
                `;
                    break;
                case 'string':
                    dto += `
                public ${camelize} ${key} = "";               
                `;
                case 'boolean':
                    dto += `
                public ${typeName} ${key} = false;               
                `;
                case 'number':
                    dto += `
                public int ${key} = 0;               
                `;
                    break;
            }

        }

        let generateFieldForSearch = '';
        let lastKey = keys.pop();
        for (let key of keys) {
            generateFieldForSearch += `
            .append(${key}).append(" ")
            `
        }
        generateFieldForSearch += `
            .append(${lastKey});
            `;

        return {dto, generateFieldForSearch};
    }
}
