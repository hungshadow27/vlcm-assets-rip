package game.display
{
   import game.base.Istate;
   import game.common.UIState;
   import game.manager.ImageCacheManager;
   
   public class ScaleImage extends Component implements Istate
   {
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _state:String;
      
      private var _scaleBitmapData:ScaleBitmapData;
      
      public function ScaleImage(param1:ScaleBitmapData = null)
      {
         super();
         this._scaleBitmapData = param1;
         if(this._scaleBitmapData)
         {
            addChild(this._scaleBitmapData);
            this._width = this._scaleBitmapData.width;
            this._height = this._scaleBitmapData.height;
         }
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function set scaleBitmapData(param1:ScaleBitmapData) : void
      {
         if(Boolean(this._scaleBitmapData) && Boolean(this._scaleBitmapData.parent))
         {
            this._scaleBitmapData.parent.removeChild(this._scaleBitmapData);
         }
         this._scaleBitmapData = param1;
         addChild(this._scaleBitmapData);
         this.setSize(this._width,this._height);
      }
      
      public function get scaleBitmapData() : ScaleBitmapData
      {
         return this._scaleBitmapData;
      }
      
      override public function set skin(param1:Object) : void
      {
         super.skin = param1;
         this.state = UIState.STATE_NORMAL;
      }
      
      public function set state(param1:String) : void
      {
         if(skin[param1] != null)
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
         var _loc1_:Object = skin[this._state];
         this.scaleBitmapData = ImageCacheManager.getScaleBitmapdata(_loc1_.link,_loc1_.width,_loc1_.height,skin.top,skin.right,skin.bottom,skin.left);
         this.x = skin.x + _loc1_.x;
         this.y = skin.y + _loc1_.y;
         this._width = skin.width;
         this._height = skin.height;
         this.setSize(this._width * this._scaleX,this._height * this._scaleY);
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         if(this._scaleBitmapData)
         {
            this._scaleBitmapData.setSize(param1,param2);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 == this.width)
         {
            return;
         }
         this.scaleX = param1 / this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 == this.height)
         {
            return;
         }
         this.scaleY = param1 / this._height;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         this._scaleX = param1;
         this.setSize(this._width * this._scaleX,this.height);
      }
      
      override public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         this._scaleY = param1;
         this.setSize(this.width,this._height * this._scaleY);
      }
      
      override public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this.mouseChildren = this.mouseChildren = param1;
      }
   }
}

