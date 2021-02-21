const path = require("path");
const dtoJson = require('./main/resources/dto.json')
module.exports = {
    params: function ({args}) {
        let typeName = this.getTypeName(dtoJson);
        if (!args.name) {
            args.name = "exmaple";
        }

        const dto = {};
        for (const key in dtoJson) {

        }

        return {name: args.name};
    },
    getTypeName: function (data) {
        return Object.prototype.toString.call(data).split(' ').pop().slice(0, -1).toLocaleLowerCase();
    }
}
