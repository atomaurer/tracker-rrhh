# Guía de despliegue — Tracker Proyectos RRHH
## Tiempo estimado: 20 minutos · No requiere conocimientos técnicos

---

## PASO 1 · Crear base de datos en Supabase (10 min)

1. Ve a **https://supabase.com** y haz clic en "Start your project"
2. Regístrate con tu cuenta de Google
3. Haz clic en **"New project"**
   - Organization: la que te crea automáticamente
   - Name: `tracker-rrhh`
   - Database Password: pon una contraseña (guárdala)
   - Region: elige **South America (São Paulo)** o la más cercana
   - Haz clic en **"Create new project"** (tarda ~2 minutos)

4. Una vez listo, ve al menú lateral → **SQL Editor**
5. Haz clic en **"New query"**
6. Copia y pega TODO el contenido del archivo `schema.sql`
7. Haz clic en **"Run"** (botón verde abajo a la derecha)
   - Deberías ver "Success. No rows returned"

8. Ahora obtén tus credenciales:
   - Menú lateral → **Project Settings** → **API**
   - Copia el valor de **"Project URL"** (algo como `https://abcde.supabase.co`)
   - Copia el valor de **"anon public"** bajo "Project API keys"

---

## PASO 2 · Configurar la aplicación (2 min)

1. Abre el archivo `index.html` con cualquier editor de texto (Notepad, TextEdit, etc.)
2. Busca estas dos líneas cerca del inicio del código JavaScript:

   ```
   const SUPABASE_URL  = 'https://TUPROYECTO.supabase.co';
   const SUPABASE_KEY  = 'TU_ANON_KEY_AQUI';
   ```

3. Reemplaza los valores entre comillas con los que copiaste en el Paso 1:
   - `SUPABASE_URL`: pega tu Project URL
   - `SUPABASE_KEY`: pega tu anon key

4. Guarda el archivo

---

## PASO 3 · Publicar en Vercel (5 min)

1. Ve a **https://vercel.com** y haz clic en "Start Deploying"
2. Regístrate con tu cuenta de Google
3. En el dashboard, haz clic en **"Add New..." → "Project"**
4. Haz clic en **"Browse"** o arrastra la CARPETA `tracker-rrhh` completa
   (debe contener: `index.html`, `vercel.json`, `schema.sql`, este README)
5. Haz clic en **"Deploy"**
6. Espera ~1 minuto. Vercel te dará una URL como:
   `https://tracker-rrhh-tuusuario.vercel.app`

---

## PASO 4 · Compartir con el equipo

Comparte esa URL con Mario, Luis, Daniel y Ato.
Cada uno abre la URL en su navegador, selecciona su nombre y puede actualizar sus proyectos.

---

## Cómo usar la aplicación cada semana

**Como líder:**
- Abre la URL → selecciona "Líder (solo lectura)"
- Revisa el Dashboard antes de la reunión semanal
- Los proyectos críticos (sin avance ≥2 sem) aparecen destacados

**Como miembro del equipo (Mario, Luis, Daniel, Ato):**
- Abre la URL → selecciona tu nombre
- Ve a "Actualizar" en el menú lateral
- Actualiza el estado, avance y plan de cada proyecto
- Haz clic en "Guardar actualización"
- El líder verá los cambios al instante

**Para agregar nuevos proyectos:**
- Haz clic en "Nuevo proyecto" en el menú lateral
- Completa el formulario y guarda

---

## Costos

- **Supabase**: Gratis hasta 500MB de base de datos y 2GB de transferencia/mes
- **Vercel**: Gratis para proyectos estáticos (sin límite para uso interno)
- **Total: $0**

---

## ¿Necesito actualizar la app en el futuro?

Si quieres agregar funciones, simplemente modifica el archivo `index.html`
y vuelve a subir la carpeta a Vercel (mismo proceso del Paso 3).
Tus datos en Supabase se mantienen intactos.
