<?php
/**
 * Created by PhpStorm.
 * User: Borys Plotka ( @3plo )
 * Date: 30.11.2019
 * Time: 23:47
 */

namespace controllers\api;


use controllers\MainController;
use model\user\enum\UserTypeEnum;
use model\user\User;

class UserToken extends MainController
{
    public function handleAction(array $params)
    {
        $login = $params['request']['l'];
        $hash = $params['request']['hash'];
        $ts = $params['request']['ts'];
        $ap = $params['request']['ap'];
        $user = new User();
        $userData = $user->getUserDataByLogin($login);
        if ($userData) {
            $user->setId($userData['id']);
            if ($user->tempHash($ts)['token'] == $hash) {
                if ($ap) {
                    if ($userData['type'] == UserTypeEnum::ACCESS_POINT) {
                        $result = [
                            'status' => '200',
                            'response_data' => $user->getUserToken(),
                        ];
                    } else {
                        $result = ['status' => 403];
                    }
                } else {
                    $result = [
                        'status' => '200',
                        'response_data' => $user->getUserToken(),
                    ];
                }
            } else {
                $result = ['status' => 403];
            }
        } else {
            $result = ['status' => 403];
        }
        echo json_encode($result);
    }
}