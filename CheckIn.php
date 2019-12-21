<?php
/**
 * Created by PhpStorm.
 * User: Borys Plotka ( @3plo )
 * Date: 01.12.2019
 * Time: 0:52
 */

namespace controllers\api;


use model\access\AccessRules;
use model\user\User;

class CheckIn extends ApiController
{
    public function handleAction(array $params)
    {
        $login = $params['request']['l'];
        $hash = $params['request']['hash'];
        $ts = $params['request']['ts'];
        if ($this->hasAccess($login, $ts, $hash)) {
            $tokenData = explode('_amp;', $params['request']['token']);
            $token = $tokenData[0];
            $userTs = $tokenData[1];
            $r = $tokenData[2];
            $userLogin = $tokenData[3];
            $accessPoint = $params['request']['p'];
            $accessType = $params['request']['t'];
            $user = new User();
            $userData = $user->getUserDataByLogin($userLogin);
            $hasAccess = false;
            if ($userData) {
                $accessRules = new AccessRules();
                $hasAccess = $accessRules->hasUserAccess(
                    $userData['id'],
                    $accessPoint,
                    $token,
                    $userTs,
                    $r,
                    $accessType
                );
            }
            echo json_encode(
                [
                    'status' => 200,
                    'has_access' => $hasAccess,
                ]
            );
        } else {
            echo json_encode(
                [
                    'status' => 403,
                ]
            );
        }
    }
}