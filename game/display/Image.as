package game.display
{
   import flash.display.Bitmap;
   import game.base.ISkin;
   import game.base.Istate;
   import game.common.UIState;
   import game.manager.ImageCacheManager;
   
   public class Image extends Bitmap implements ISkin, Istate
   {
      
      protected var _skin:Object;
      
      protected var _state:String;
      
      private var _enabled:Boolean;
      
      public function Image()
      {
         super(null,"auto",false);
      }
      
      public function set skin(param1:Object) : void
      {
         this._skin = param1;
         this.name = this._skin.name;
         this.state = UIState.STATE_NORMAL;
      }
      
      public function get skin() : Object
      {
         return this._skin;
      }
      
      public function set state(param1:String) : void
      {
         if(this._skin[param1] != null)
         {
            this._state = param1;
            this.updateState();
         }
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      protected function updateState() : void
      {
         var _loc1_:Object = this._skin[this._state];
         this.bitmapData = ImageCacheManager.getBitmapData(_loc1_.link,_loc1_.width,_loc1_.height);
         this.x = this._skin.x + _loc1_.x;
         this.y = this._skin.y + _loc1_.y;
         this.width = _loc1_.width;
         this.height = _loc1_.height;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(param1 == true)
         {
            this.state = UIState.STATE_NORMAL;
         }
         else
         {
            this.state = UIState.STATE_DISABLE;
         }
         this._enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
   }
}

