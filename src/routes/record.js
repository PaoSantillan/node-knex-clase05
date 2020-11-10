// Endpoints for external data
const express = require('express');
const router = express.Router();
const knex = require('../db')

//All records
/**SELECT * FROM records */
router.route('/records')
    .get(async (req, res) => {
        const records = await knex
            .select()
            .from('records')
            
        res.json({records});
});

//All records, filter "archivo"
/**SELECT archivo FROM records */
router.route('/records/onlyname')
    .get(async (req, res) => {
        const records = await knex
            .select('archivo')
            .from('records')

        res.json({records});
});

//Only unique name
/**SELECT DISTINCT archivo FROM records; */
router.route('/records/distinct')
    .get(async (req, res) => {
        const records = await knex('records')
            .distinct('archivo')

        res.json({records});
});

/**http://localhost:8000/api/records/where?id=2 */
/*SELECT * FROM records WHERE id=2;*/
router.route('/records/where')
    .get(async (req, res) => {
        const records = await knex('records')
            .where(req.query)
            .select()
        res.json({records});
});


//Order by ASC DEFAULT
/*SELECT * FROM records ORDER BY id ASC;
SELECT * FROM records ORDER BY id;
SELECT * FROM records ORDER BY id DESC;*/

//http://localhost:8000/api/records/orderBy/id/desc
//http://localhost:8000/api/records/orderBy/id/asc
router.route('/records/orderBy/:column/:order')
    .get(async (req, res) => {
        const {column, order} = req.params;
        const records = await knex('records')
            .select()
            .orderBy(column, order)

        res.json({records});
});

//Join two tables, records and type_records
/*SELECT records.id AS id_record, records.archivo, type_records.id AS id_type_record, type_records.nombre AS type_record
FROM records
JOIN type_records
ON records.type_record_id = type_records.id;*/
router.route('/records/joinWithType')
    .get(async (req, res) => {
        const records = await knex('records')
            .join('type_records', 'records.type_record_id', '=', 'type_records.id')
            .select("records.id AS id_record", "records.archivo", "type_records.id AS id_type_record", "type_records.nombre AS type_record")

        res.json({records});
});

module.exports = router;