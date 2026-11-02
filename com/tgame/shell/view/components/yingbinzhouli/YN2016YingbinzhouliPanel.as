package com.tgame.shell.view.components.yingbinzhouli
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Image;
   import game.display.SimpleButton;
   import game.skin.YinBinZouLiSkin;
   import game.utils.SkinTools;
   
   public class YN2016YingbinzhouliPanel extends BasePanel
   {
      
      public static const LINGQUJIANGLI:String = "YINGBINZHOULILINGQUJIANGLI";
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var img1:Image;
      
      private var img2:Image;
      
      private var img3:Image;
      
      private var item:ItemFace;
      
      private var _container:Container;
      
      private var guanbi:SimpleButton;
      
      public function YN2016YingbinzhouliPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YinBinZouLiSkin.skin,"yingbingzhouli");
      }
      
      override protected function createVariableReference() : void
      {
         this.btn1 = getChildByName("YBZLLQAN1") as SimpleButton;
         this.btn2 = getChildByName("YBZLLQAN2") as SimpleButton;
         this.img1 = getChildByName("Checked1") as Image;
         this.img2 = getChildByName("Checked2") as Image;
         this.img3 = getChildByName("Checked3") as Image;
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this._container = new Container();
         addChild(this._container);
         this.item = new ItemFace(new Goods(712836),65,65);
         this.item.x = 102;
         this.item.y = 199;
         this._container.addChild(this.item);
         this.item = new ItemFace(new Goods(712837),65,65);
         this.item.x = 535;
         this.item.y = 199;
         this._container.addChild(this.item);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               if(this.btn1.enabled)
               {
                  dispatchEvent(new BaseEvent(YN2016YingbinzhouliPanel.LINGQUJIANGLI,"",1));
               }
               break;
            case this.btn2:
               if(this.btn2.enabled)
               {
                  dispatchEvent(new BaseEvent(YN2016YingbinzhouliPanel.LINGQUJIANGLI,"",2));
               }
         }
      }
      
      public function setData(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = int(param1[0]);
         if(_loc2_ >= 3)
         {
            _loc2_ = 3;
         }
         _loc3_ = 1;
         while(_loc3_ <= 3)
         {
            this["img" + _loc3_].visible = false;
            _loc3_++;
         }
         _loc3_ = 1;
         while(_loc3_ <= param1[0])
         {
            this["img" + _loc3_].visible = true;
            _loc3_++;
         }
         this.btn1.enabled = param1[1];
         this.btn2.enabled = param1[2];
      }
   }
}

