<?php

namespace App\Http\Controllers;

use \Session;
use \Auth;
use Illuminate\Http\Request;

class inicioController extends Controller
{
	public function index()
    {
        return view('auth.login');
    }

    protected function getInicio()
    {
        return View('inicio');
    }

    public function logOutInicio()
    {
    	Auth::logout();
    	Session::flush();
		return view('auth.login');
    }

    public function defaultBaseDatos(Request $request)
    {
        $idUser = Auth::id();
        $usuario = \App\Usuarios::find($idUser);
        $usuario->BaseDatosAux = $request->baseDatos;
        $usuario->save();
        return response()->json( array('success' => true, 'mensaje'=> 'Base de Datos Aux establecida con exito.') );
    }
}
