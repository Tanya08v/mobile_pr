<?php
/**
 * Created by PhpStorm.
 * User: Borys Plotka ( @3plo )
 * Date: 20.12.2019
 * Time: 20:53
 */

namespace controllers\api;


use controllers\MainController;
use model\user\User;

abstract class ApiController extends MainController
{
    /**
     * @param string $login
     * @param int $ts
     * @param string $hash
     * @return bool
     * @author Borys Plotka ( @3plo )
     */
    protected function hasAccess(string $login, int $ts, string $hash): bool
    {
        $user = new User();
        $userData = $user->getUserDataByLogin($login);
        if ($userData) {
            $user->setId($userData['id']);
            if ($user->tempHash($ts)['token'] == $hash) {
                return true;
            }
        }
        return false;
    }
}