// JavaScript Document
 var MAX_WIDTH   = 430;  
 var MAX_HEIGHT  = 430;  
 function resizeImage( source_image , max_width , max_height){  
     var image = new Image();  
     image.src = source_image.src;  
     if (!max_width || parseInt(max_width) <= 0){  
         max_width = MAX_WIDTH;  
     }  
     if (!max_height || parseInt(max_height) <= 0){  
         max_height = MAX_HEIGHT;  
     }  
     //开始检查图片  
     if(image.width > 0 && image.height > 0 ){  
         var image_rate = 1;  
         if( (max_width / image.width) < (max_height / image.height)){  
             image_rate = max_width / image.width ;  
         }else{  
             image_rate = max_height / image.height ;  
         }  
         if ( image_rate <= 1){  
             source_image.width  = image.width * image_rate;  
             source_image.height = image.height * image_rate;  
         }  
     }  
}  
