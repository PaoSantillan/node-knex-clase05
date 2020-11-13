// Endpoints for external data
const express = require('express');
const router = express.Router();
const knex = require('../db')

//All records
/**SELECT * FROM records */
router.route('/records')
    .get(async (req, res) => {
        const records = await knex('records')
            .whereNull('deleted_at')
            .select()
            
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


//Create record
/*INSERT INTO `records`(`id`, `archivo`, `type_record_id`, `created_at`, `updated_at`, `deleted_at`) 
                VALUES (NULL,'foto_desde_node3.jpg',1,NULL,NULL,NULL)
*/
router.route('/records/insert')
    .post(async (req, res) => {
        await knex('records')
            .insert(req.body)

        res.send({success: true});
});

//Table tags
router.route('/tags/insert')
    .post(async (req, res) => {
        await knex('tags')
            .insert(req.body)

        res.send({success: true});
});

//Update record
/*UPDATE records SET archivo = "new_name_picture.jpg" WHERE id = 1*/
router.route('/records/update/:id')
    .patch(async (req, res) => {
        await knex('records')
            .where('id', '=', req.params.id)
            .update(req.body)

        res.send({success: true});
});

//Update tags 
/*UPDATE tags SET title = "new_name_tag.jpg"*/
router.route('/tags/update/all')
    .patch(async (req, res) => {
        await knex('tags')
            .update(req.body)

        //Esta es otra forma de hacerlo, pueden probarla si quieren
        //Aqui aclaran el campo que quieren actualizar, si mandan el req.body lo interpreta solo
        /*const new_tags = await knex('tags')
        .update({
            title: 'new_name_tag2.jpg'
        })*/

        res.send({success: true});
});

//Delete record (soft)
/*UPDATE records SET deleted_at = (fecha actual) WHERE id = 1 */
router.route('/records/delete/:id')
    .delete(async (req, res) => {
        await knex('records')
            .where({
                id: req.params.id
            })
            .update({
                deleted_at: new Date()
            })

        res.send({success: true});
});

module.exports = router;