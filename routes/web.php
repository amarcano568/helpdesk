<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::group(['middleware' => 'auth'], function (){
	
    Route::get('/', 'inicioController@getInicio');
	Route::get('/home', 'inicioController@getInicio');
	Route::get( 'inicio' , 'inicioController@getInicio' );
	Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout'); 
	Route::get('default-base-datos', 'inicioController@defaultBaseDatos'); 
	

	/**
	 *   Usuarios
	 */
	Route::get('mantUsuarios', 'mantenimientoController@loadUsuarios');
	Route::get('carga-Usuarios', 'mantenimientoController@cargaUsuarios');
	Route::post('registrar-usuario', 'mantenimientoController@registrarUsuario');
	Route::get('buscar_usuario', 'mantenimientoController@buscarUsuario');
	Route::get('verifica-licencia', 'mantenimientoController@verificaLicencia');
	Route::get('bloquear_usuario', 'mantenimientoController@bloquearUsuario');
	Route::get('interactua-cayro', 'mantenimientoController@interactuaCayro');
	
	/**
	 *   Empresa
	 */
	Route::get('mantEmpresa', 'mantenimientoController@loadEmpresa');
	Route::post('actualiza-empresa', 'mantenimientoController@actualizaEmpresa');	

	/**
	 *   Mnatenimiento tipo de Tickets
	 */
	Route::get('mantTickets', 'mantenimientoController@loadMantTicket');
	Route::get('carga-tipos-tickets', 'mantenimientoController@cargaTiposTickets');
	Route::get('llenar-chosen-areas', 'mantenimientoController@llenarChosenAreas');
	Route::post('registrar-mant-ticket', 'mantenimientoController@registrarMantTicket');

	/**
	 *   Mnatenimiento de Categorías y Subcategorías
	 */
	Route::get('mantCategorias', 'mantenimientoController@loadMantCategorias');
	Route::get('listar-categoria', 'mantenimientoController@listarCategoria');
	Route::get('listar-aplicacion', 'mantenimientoController@listarAplicacion');
	Route::post('registrar-sub-categoria', 'mantenimientoController@registrarSubCategoria');
	Route::get('Act-Des-SubCategoria', 'mantenimientoController@ActDesSubCategoria');
	Route::post('registrar-aplicacion', 'mantenimientoController@registrarAplicacion');
	Route::get('Act-Des-Categoria', 'mantenimientoController@ActDesCategoria');
	Route::post('registrar-categoria', 'mantenimientoController@registrarCategoria');

	/**
	 *   Solicitud de Soporte
	 */
	Route::get('solicitudSoporte', 'soporteController@solicitudSoporte');
	Route::get('listar-tipo_ticket', 'soporteController@listarTipoTicket');
	Route::get('listar-categoria-ticket', 'soporteController@listarCategoriaTicket');
	Route::get('carga-sub-categoria', 'soporteController@cargaSubCategoria');
	Route::get('carga-sub-problemas', 'soporteController@cargaSubProblemas');
	Route::get('listar_resumen_ticket_usuarios', 'soporteController@listarResumenTicketUsuarios');
	Route::post('up-files-support', 'soporteController@upFilesSupport');
	Route::post('enviar-ticket', 'soporteController@enviarTicket');
	Route::get('listar-tickets-usuarios', 'soporteController@listarTicketsUsuarios');
	Route::get('obtener-detalle-ticket', 'soporteController@obtenerDetalleTicket');
	Route::get('anular-ticket', 'soporteController@anularTicket');
	Route::post('encuesta-ticket', 'soporteController@encuestaTicket');

	/**
	 *   Administración de Soporte
	 */

	// Route::get('admin-Soporte', function () {
	// 	$usuarios = \App\Usuarios::->where(function($q) use ($variable){
	// 		          $q->where('Cab', 'AGE')
	// 		            ->orWhere('Cab','ADM');
	// 		      	})->where('idArea',$idArea)->where('status',1)->get();
	//     return view('adminSoporte.adminSoporte',$data);
	// });

	Route::get('admin-Soporte', 'soporteController@adminSoporte');
	Route::get('listar-tickets-Gestores', 'soporteController@listarTicketsGestores');
	Route::get('listar_resumen_ticket_gestores', 'soporteController@listarResumenTicket_gestores');
	Route::get('asignar-ticket', 'soporteController@asignarTicket');
	Route::get('iniciar-ticket', 'soporteController@iniciarTicket');
	Route::get('pausar-ticket', 'soporteController@pausarTicket');
	Route::get('pbr-frecuente', 'soporteController@pbrFrecuente');
	Route::get('terminar-ticket', 'soporteController@terminarTicket');
	Route::get('new-solution', 'soporteController@newSolution');
	Route::post('registrar-nuevo-activo', 'soporteController@registrarNuevoActivo');
	Route::post('up-files-support-2', 'soporteController@upFilesSupport2');
	Route::post('cambiar-area-ticket', 'soporteController@cambiarAreaTicket');
	Route::post('reapertura-ticket', 'soporteController@reaperturaTicket');

	/**
	 *  Correo
	 */
	Route::get('config-correo', 'mantenimientoController@configCorreo');
	Route::post('actualiza-correo', 'mantenimientoController@actualizaCorreo');
	Route::get('enviar-correo', 'correoController@enviarCorreo');

	Route::get('ver-notificaciones', function () {		
	    return view('notificaciones');
	});

	/**
	 *  Mensajes
	 */	
	Route::get('enviar-mensaje-ticket', 'soporteController@enviarMensajeTicket');
	Route::get('listar-mensaje-ticket', 'soporteController@listarMensajeTicket');

	/**
	 * 			Perfil del Usuario
	 */
	Route::get('perfil-usuario', 'mantenimientoController@perfilUsuario');
	Route::get('listar-tickets-perfil', 'mantenimientoController@listarTicketsPerfil');
	Route::get('buscar-imagen-usuario', 'mantenimientoController@buscarImagenUsuario');
	Route::post('subir-foto', 'mantenimientoController@subirFoto');

	/**
	 * 			Mestro de Empresas Solo SuperUser
	 */
	Route::get('maestro-empresa', 'maestroEmpresasController@listarMaestroEmpresa');
	Route::get('carga-maestro-empresas', 'maestroEmpresasController@cargaMaestroEmpresas');
	Route::post('registrar-maestro-empresa', 'maestroEmpresasController@registrarMaestroEmpresa');
	Route::get('obtener-informacion-empresa', 'maestroEmpresasController@obtenerInformacionEmpresa');
	Route::post('actualizar-datos-empresa', 'maestroEmpresasController@actualizarDatosEmpresa');
	Route::get('Act-Des-Empresa', 'maestroEmpresasController@ActDesEmpresa');

	/**
	 * 				Reportes
	 */
	Route::get('report-ticket-enviados', 'reportesController@reportTicketEnviados');
	Route::get('listados-tickets-enviados', 'reportesController@listadosTicketsEnviados');
	Route::get('grafico-reporte-ticket-recibido', 'reportesController@graficoReporteTicketRecibido');
});
