<?php
namespace app\major\model;

use think\Model;

class Major extends Model
{
    protected $table = 'unmajor';

    public function Academy()
    {
        return $this->belongsTo("Academy", "academy_id", "academy_id");
<<<<<<< HEAD
=======

>>>>>>> 336b0b15050fe29376ac8ae3acdbe02ad7c42ec4
    }
}


