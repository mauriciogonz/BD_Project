//importamos las librerias necesarias
const express = require('express');
const { Pool } = require('pg');
//instanciamos nuestro objeto de express
const app = express();
//Con esto facilitaremos la comunicacion
app.use(express.json())



app.listen(3000, () => {
    console.log("Servidor en linea en el puerto 3000")
})

//instanciamos nuestro objeto de la libreria pg con los datos de conexion
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Universidad',
    password: '123456',
    port: 5432
});

app.get('/mostrarCarrera', async (req, res) => {
    const carreras = await pool.query("SELECT * FROM carrera");
    return res.status(200).json({
        carreras: carreras.rows
    });
})

app.get('/mostrarAsignatura', async (req, res) => {
    const asignaturas = await pool.query("SELECT * FROM asignatura");
    return res.status(200).json({
        asignaturas: asignaturas.rows
    });
})

app.get('/mostrarEstudiante', async (req, res) => {
    const carreras = await pool.query("SELECT * FROM estudiante");
    return res.status(200).json({
        carreras: carreras.rows
    });
})

app.get('/mostrarDocente', async (req, res) => {
    const carreras = await pool.query("SELECT * FROM docente");
    return res.status(200).json({
        carreras: carreras.rows
    });
})

app.get('/mostrarAuditoria', async (req, res) => {
    const asignaturas = await pool.query("SELECT * FROM auditoria");
    return res.status(200).json({
        asignaturas: asignaturas.rows
    });
})

app.post("/crearCarrera", async (req, res) => {
    const { nombreCarrera, semestreCarrera } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const carrera = await pool.query(`INSERT INTO carrera(nombre_car, semestres_car) 
    VALUES('${nombreCarrera}',' ${semestreCarrera}') RETURNING *`);
    return res.status(200).json({
        carreraInsertada: carrera.rows
    })
})

app.post("/crearAsignatura", async (req, res) => {
    const { NOMBRE_ASIGNATURA, CREDITOS_ASIGNATURA } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const asignatura = await pool.query(`INSERT INTO asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA)
    VALUES('${NOMBRE_ASIGNATURA}', '${CREDITOS_ASIGNATURA}') RETURNING *`);
    return res.status(200).json({
        asignaturaInsertada: asignatura.rows
    })
})

app.post("/crearDocente", async (req, res) => {
    const { NOMBRE_DOC, FECHA_NACIMIENTO_DOC, DIRECCION_DOC, TELEFONO_DOC } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const docente = await pool.query(`INSERT INTO docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC)  
    VALUES('${NOMBRE_DOC}', TO_DATE('${FECHA_NACIMIENTO_DOC}','dd,mm,yyyy'),'${DIRECCION_DOC}', '${TELEFONO_DOC}') RETURNING *`);
    return res.status(200).json({
        docenteInsertada: docente.rows
    })
})

app.post("/crearEstudiante", async (req, res) => {
    const { nombreEst, fechaNacimientoEst, semestreEst, generoEst, trabajaEst, facebook, idCarrera } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const estudiante = await pool.query(`INSERT INTO estudiante(nombre_est,fecha_nacimiento_est, semestre_est,genero_est,trabaja_est,facebook,id_carrera)
     VALUES('${nombreEst}',TO_DATE('${fechaNacimientoEst}','dd,mm,yyyy'),'${semestreEst}','${generoEst}','${trabajaEst}','${facebook}', ${idCarrera}) RETURNING *`);
    return res.status(200).json({
        estudianteInsertada: estudiante.rows
    })
})

app.put("/actualizarCarrera", async (req, res) => {
    const { id, nombreCarrera, semestreCarrera } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const carrera = await pool.query(`UPDATE carrera SET nombre_car='${nombreCarrera}',semestres_car=' ${semestreCarrera}' where id_carrera=${id}   RETURNING *`);
    return res.status(200).json({
        carreraActualizada: carrera.rows
    })
})

app.put("/actualizarAsignatura", async (req, res) => {
    const { id_asignatura, nombreAsignatura, creditosAsignatura } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const asignatura = await pool.query(`UPDATE asignatura SET NOMBRE_ASIGNATURA='${nombreAsignatura}',CREDITOS_ASIGNATURA=' ${creditosAsignatura}' where id_asignatura=${id_asignatura}   RETURNING *`);
    return res.status(200).json({
        asignaturaActualizada: asignatura.rows
    })
})

app.put("/actualizarDocente", async (req, res) => {
    const { id_docente, nombre_doc, fecha_nacimiento_doc, direccion_doc, telefono_doc } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const docente = await pool.query(`UPDATE docente SET nombre_doc='${nombre_doc}',
    fecha_nacimiento_doc=TO_DATE('${fecha_nacimiento_doc}','dd,mm,yyyy'), direccion_doc='${direccion_doc}',telefono_doc='${telefono_doc}' where id_docente=${id_docente} RETURNING *`);
    return res.status(200).json({
        docenteActualizado: docente.rows
    })
})

app.put("/actualizarEstudiantes", async (req, res) => {
    const { id, nombreEst, fechaNacimientoEst, semestreEst, generoEst, trabajaEst, facebook, idCarrera } = req.body;
    const estudiante = await pool.query(`UPDATE estudiante SET nombre_est='${nombreEst}',
    fecha_nacimiento_est=TO_DATE('${fechaNacimientoEst}','dd,mm,yyyy'),semestre_est='${semestreEst}',
    genero_est='${generoEst}', trabaja_est='${trabajaEst}',facebook='${facebook}',id_carrera=${idCarrera}
     where id_estudiante=${id} RETURNING *`);
    return res.status(200).json({
        estudianteActualizada: estudiante.rows
    })
})

app.delete("/eliminarAsignatura", async (req, res) => {
    const { id_asignatura } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const asignatura = await pool.query(`delete from asignatura where id_asignatura=${id_asignatura}  RETURNING *`);
    return res.status(200).json({
        asignaturaBorrada: asignatura.rows
    })
})

app.delete("/eliminarEstudiante", async (req, res) => {
    const { id } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const estudiante = await pool.query(`delete from estudiante where id_estudiante=${id}  RETURNING *`);
    return res.status(200).json({
        estudianteBorrada: estudiante.rows
    })
})

app.delete("/eliminarCarrera", async (req, res) => {
    const { id } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const carrera = await pool.query(`delete from carrera where id_carrera=${id}  RETURNING *`);
    return res.status(200).json({
        carreraBorrada: carrera.rows
    })
})

app.delete("/eliminarDocente", async (req, res) => {
    const { id } = req.body;
    // ${varName} nos permite incrustar dentro de nuestros Strings
    const docente = await pool.query(`delete from docente where id_docente=${id}  RETURNING *`);
    return res.status(200).json({
        docenteBorrado: docente.rows
    })
})

