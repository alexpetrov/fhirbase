--db:fhirb -e
/* --{{{ */

/* select ('{}'::jsonb->>'ups') is null; */
/* --}}} */

/* --{{{ */
/* SELECT * FROM index_identifier_to_token( */
/*   $JSON$ */
/*   { */
/*     "use": "usual", */
/*     "system": "urn:oid:2.16.840.1.113883.2.4.6.3", */
/*     "value": "738472983" */
/*   } */
/*   $JSON$ */
/* ); */
/* --}}} */

/* --{{{ */
/* SELECT * FROM index_coding_to_token( */
/*   $JSON$ */
/*   { */
/*     "system": "urn:ietf:bcp:47", */
/*     "code": "nl", */
/*     "display": "Dutch" */
/*   } */
/*   $JSON$ */
/* ); */
/* --}}} */

/* --{{{ */
/* SELECT * FROM unnest(index_codeable_concept_to_token( */
/*   $JSON$ */
/*   { */
/*   "coding": [ */
/*   { */
/*   "system": "urn:ietf:bcp:47", */
/*   "code": "nl", */
/*   "display": "Dutch" */
/*   } */
/*   ], */
/*   "text": "Nederlands" */
/*   } */
/*   $JSON$ */
/* )); */
/* --}}} */

/* --{{{ */
/* select * from fhir.resource_indexables */
/* where type = '_NestedResource_' */
/* ; */
/* --}}} */


/* --{{{ */
/* SELECT * FROM index_string_complex_type( */
/*   '{Patient,address}', */
/*   $JSON$ */
/*   { */
/*   "use": "home", */
/*   "line": [ */
/*   "534 Erewhon St" */
/*   ], */
/*   "city": "PleasantVille", */
/*   "state": "Vic", */
/*   "zip": "3999" */
/*   } */
/*   $JSON$ */
/* ); */
/* --}}} */


/* --{{{ */
/* \set pt `curl http://www.hl7.org/implement/standards/fhir/patient-example.json` */

/* SELECT unnest(index_reference_resource(:'pt'::jsonb)); */
/* --}}} */


/* --{{{ */
/* \set subj `curl http://www.hl7.org/implement/standards/fhir/relatedperson-example-f002-ariadne.json` */

/* SELECT unnest(index_string_resource(:'subj'::jsonb)); */
/* --}}} */

/* --{{{ */
/* create extension pgcrypto; */
/* select gen_random_uuid(); */
/* --}}} */

/* \set pt `curl http://www.hl7.org/implement/standards/fhir/patient-example.json` */
/* SELECT insert_resource(:'pt'::jsonb); */

/* --{{{ */
/* \set pt `curl http://www.hl7.org/implement/standards/fhir/patient-example.json` */

/* delete from patient_search_string; */
/* delete from patient_search_token; */
/* delete from patient_search_date; */
/* -- delete from patient_search_quantity; */
/* delete from patient_history; */
/* delete from patient; */

/* SELECT insert_resource(:'pt'::jsonb); */
/* select update_resource(logical_id, data) FROM patient; */

/* select * from patient_search_token; */
/* select * from patient_search_string; */
/* select * from patient; */
/* select * from patient_history; */
/* select * from patient_search_date; */
/* --}}} */

/* --{{{ */
/* \set subj  `curl http://www.hl7.org/implement/standards/fhir/encounter-example-f002-lung.json` */

/* delete from encounter_search_string; */
/* delete from encounter_search_token; */
/* delete from encounter; */
/* \timing */
/* SELECT insert_resource(:'subj'::jsonb); */
/* select * from encounter_search_token; */
/* select * from encounter; */

/* --}}} */



/* --{{{ */
/* select DISTINCT(type) from fhir.resource_indexables */
/* where search_type = 'token' */
/* and param_name <> '_id'; */
/* --}}} */
/* --{{{ */
/* \d patient_search_token */
/* --}}} */

/* --{{{ */
/* \set pt `curl http://www.hl7.org/implement/standards/fhir/patient-example.json` */
/* SELECT unnest(index_date_resource(:'pt'::jsonb)); */
/* --}}} */

/* --{{{ */
/* \set ma `curl http://hl7.org/implement/standards/fhir/medicationadministration-example.json` */
/* SELECT unnest(index_date_resource(:'ma'::jsonb)); */
/* --}}} */

/* --{{{ */
/* \set pt `curl http://www.hl7.org/implement/standards/fhir/patient-example.json` */
/* SELECT unnest(index_date_resource(:'pt'::jsonb)); */
/* --}}} */
/* j */
/* --{{{ */
/* \set cond `curl http://hl7.org/implement/standards/fhir/condition-example-f201-fever.json` */
/* SELECT unnest(index_date_resource(:'cond'::jsonb)); */
/* --}}} */
/* --{{{ */
/* \set dr `curl http://hl7.org/implement/standards/fhir/documentreference-example.json` */
/* SELECT unnest(index_date_resource(:'dr'::jsonb)); */
/* --}}} */

/* --{{{ */
/* SELECT index_schedule_to_date('when', $JSON$ */
/* {"event": [{"start": "2011-12-23"}], */
/* "repeat":{"frequency":1,"duration":1,"units":"d"}} */
/* $JSON$); */
/* --}}} */

/* --{{{ */
/* SELECT index_schedule_to_date('when', $JSON$ */
/* {"event": [{"start": "2011-12-23"}, */
/*            {"start": "2012-11-23"}, */
/*            {"start": "2012-12-23", "end": "2012-12-27"}]} */
/* $JSON$); */
/* --}}} */
