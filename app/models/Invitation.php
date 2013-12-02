<?php

class Invitation extends Eloquent
{
	protected $softDelete = true;

	public function invoice()
	{
		return $this->belongsTo('Invoice');
	}

	public function contact()
	{
		return $this->belongsTo('Contact');
	}

	public function user()
	{
		return $this->belongsTo('User');
	}	
}

Invitation::created(function($invitation)
{
	Activity::emailInvoice($invitation);
});