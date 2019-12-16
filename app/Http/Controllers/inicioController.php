<?php

namespace App\Http\Controllers;

use \Session;
use \Auth;
use Illuminate\Http\Request;
use Caffeinated\Shinobi\Models\Role;
use Caffeinated\Shinobi\Models\Permission;
use Caffeinated\Shinobi\Traits\ShinobiTrait;
use App\User;

class inicioController extends Controller
{
    use ShinobiTrait;
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
        $usuario = \App\User::find($idUser);
        $usuario->BaseDatosAux = $request->baseDatos;
        if ($request->baseDatos=='cayro'){
            $rol = Auth::user()->rol;
            $rolAsignar = $rol == 'adm' ? 'admin' : 'agente';
            $usuario->assignRole('usuario');
            $usuario->revokeRole($rolAsignar);
        }else{
            $rol = Auth::user()->rol;
            $rolAsignar = $rol == 'adm' ? 'admin' : 'agente';
            $usuario->assignRole($rolAsignar);
            $usuario->revokeRole('usuario');
        }
        
        $usuario->save();
        
        return response()->json( array('success' => true, 'mensaje'=> 'Base de Datos Aux establecida con exito.') );
    }
}
