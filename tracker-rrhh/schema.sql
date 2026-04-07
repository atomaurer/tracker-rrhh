-- ============================================================
-- SCHEMA TRACKER PROYECTOS RRHH
-- Ejecuta este SQL en Supabase > SQL Editor > New query
-- ============================================================

-- Tabla principal de proyectos
create table if not exists projects (
  id          text primary key,
  tema        text not null,
  area        text,
  resp        text,
  estado      text default 'EN PROCESO',
  prioridad   text default 'Media',
  pct         integer default 0,
  sem_sin     integer default 0,
  avance      text,
  plan        text,
  bloqueo     text,
  updated_by  text,
  updated_at  timestamptz default now(),
  created_at  timestamptz default now()
);

-- Tabla de historial de actualizaciones
create table if not exists historial (
  id          bigserial primary key,
  project_id  text references projects(id),
  tema        text,
  usuario     text,
  estado      text,
  avance      text,
  plan        text,
  created_at  timestamptz default now()
);

-- Habilitar acceso público (sin autenticación, solo para uso interno)
alter table projects  enable row level security;
alter table historial enable row level security;

create policy "allow_all_projects"  on projects  for all using (true) with check (true);
create policy "allow_all_historial" on historial for all using (true) with check (true);

-- ============================================================
-- DATOS INICIALES (proyectos del equipo al 01/04/2026)
-- ============================================================
insert into projects (id,tema,area,resp,estado,prioridad,pct,sem_sin,avance,plan,bloqueo) values
('P-01','Actualización de Bandas e incrementos Staff','Compensaciones','Mario','EN PROCESO','Alta',60,3,'Sin avance','Presentar la propuesta al CEO.','Pendiente reunión con CEO.'),
('P-02','LC Staff – Propuesta niveles internos','Desarrollo Org.','Luis / Mario / Daniel','EN PROCESO','Alta',70,2,'Sin avance','Presentar la propuesta al CEO.',''),
('P-03','Organigramas pendientes','Desarrollo Org.','Luis','EN PROCESO','Media',60,0,'Ver Plan Org Detallado','Ver resumen.',''),
('P-04','Cultura MCP','Cultura','Daniel','EN PROCESO','Alta',45,1,'BUK no cumplió expectativa. Finanzas personales: empresa Zegel ganó licitación.','Seguimiento a aprobación de CEO.','CEO no responde propuesta de Cultura (3+ semanas).'),
('P-05','Piloto equipos teleoperados y Tractores','Desarrollo Org.','Luis','EN PROCESO','Alta',50,0,'Revisión info TICA. Análisis impacto camiones autónomos. Correo enviado 01/04.','Elaborar comunicación. Alinear con líderes. Revisar convenio confidencialidad.',''),
('P-06','Clima 2025','Cultura','Daniel','EN PROCESO','Alta',85,0,'Terminando reportes por VP. RRHH listo para enviar.','Iniciar agenda con VP''s y Gerentes.',''),
('P-07','OID''s / KPI''s 2026','Performance','Daniel','EN PROCESO','Alta',80,0,'Definición de KPI''s cerrada. Solicitados resultados a Gerencias.','Solicitar OID''s a las áreas.',''),
('P-08','Hoja de ruta AI / People Analytics','Planif. Estratégica','Mario','EN PROCESO','Alta',40,0,'Propuesta enviada a Presupuesto. Definido como OPEX con Roberto Soto.','Reformular memo para habilitar presupuesto.',''),
('P-09','Tercerización Mantto Planta','RRII','Luis','EN PROCESO','Media',30,4,'Sin avance. Ver contingencia contratista Mainin.','Seguimiento a implementación.','Ver nota de Martin sobre labores Mainin.'),
('P-10','Tercerización Kingsmill','RRII','Ato','EN PROCESO','Media',20,8,'Sin avance.','Reporte de Clima Kingsmill pendiente.','Sin avance por 8 semanas consecutivas.'),
('P-11','GIO – Centro de Operaciones Integradas','Desarrollo Org.','Todos','EN PROCESO','Alta',55,1,'Pendiente pasar Org GIO a WX. Reunión agendada A. Muñoz 01/04.','Ejecutar reunión con A. Muñoz.',''),
('P-12','Análisis promoción personal obrero','Compensaciones','Mario','STAND BY','Baja',10,5,'Sin avance.','Primer avance del reporte.','En stand by por prioridades Q1.'),
('P-13','Destaque RH a China – Sra. Wang Xing','RRII','Ato','EN PROCESO','Media',10,8,'Sin avance.','Elaborar propuesta de destaque a China.','Sin avance por 8 semanas consecutivas.'),
('P-14','Perfil puesto nueva persona de China','Desarrollo Org.','Luis','EN PROCESO','Media',30,0,'Elaboración del perfil iniciada (coord. DH y ADP).','Avanzar cuando se confirme llegada.',''),
('P-15','Caso Despachador – Henrry Paz','RRII','Ato','EN PROCESO','Media',10,8,'Sin avance.','Definir próximos pasos.','Sin avance por 8 semanas consecutivas.'),
('P-16','Bonos ahorro costos Mantto','Compensaciones','Mario','CERRADO','—',100,0,'Cerrado. Comunicación previa fue suficiente.','—',''),
('P-17','Reporte de productividad 2025-6','Performance','Luis','CERRADO','—',100,0,'Cerrado.','—',''),
('P-18','KPI 2025 Cierre y convocatoria','Performance','Daniel','CERRADO','—',100,0,'Cerrado.','—',''),
('P-19','Incrementos LC Workers paso Q','Compensaciones','Mario','CERRADO','—',100,0,'Cartas enviadas a Workers.','—','')
on conflict (id) do nothing;
