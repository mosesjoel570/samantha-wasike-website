import { useEffect, useState } from "react";

export default function LoadingScreen(){

const [hide,setHide]=useState(false);

useEffect(()=>{

const timer=setTimeout(()=>{

setHide(true);

},1500);

return()=>clearTimeout(timer);

},[]);

if(hide) return null;

return(

<div className="fixed inset-0 z-[99999] flex items-center justify-center bg-white">

<div className="flex flex-col items-center">

<div className="h-20 w-20 animate-spin rounded-full border-4 border-slate-200 border-t-blue-700"/>

<h2 className="mt-8 text-3xl font-bold text-blue-700">

Samantha Wasike

</h2>

<p className="mt-2 text-slate-600">

Certified Nursing Assistant

</p>

</div>

</div>

);

}
