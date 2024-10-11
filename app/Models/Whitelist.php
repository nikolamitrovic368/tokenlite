<?php
/**
 * Transaction Model
 *
 *  Manage the Transactions
 *
 * @package TokenLite
 * @author Softnio
 * @version 1.1.6
 */
namespace App\Models;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\PaymentMethod;
use Illuminate\Database\Eloquent\Model;

class Whitelist extends Model
{

    /*
     * Table Name Specified
     */
    protected $table = 'whitelist';

    protected $fillable = ['id', 'address'];

}
