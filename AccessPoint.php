<?php
/**
 * Created by PhpStorm.
 * User: Borys Plotka ( @3plo )
 * Date: 20.12.2019
 * Time: 20:39
 */

namespace controllers\api;


use controllers\MainController;
use model\access\AccessPoint as ModelAccessPoint;

class AccessPoint extends MainController
{
    public function handleAction(array $params)
    {
        $accessPoint = new ModelAccessPoint();
        echo json_encode(
            [
                'status' => 200,
                'list' => $accessPoint->getAccessPointList(),
            ]
        );
    }
}