package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YN2016WangzhezhanqiPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var spr:Sprite;
      
      private var selectSpr:Sprite;
      
      private var goArr:Array = [723498,723499,723500,723501,723502,723503,723504,723505,723506,723507,723508,723509,723510,723511,723512,723513,723514,723515,723516,723517,723518,723519,723520,723521,723522];
      
      private var selectID:int = -1;
      
      private var selectMC:DisplayObject;
      
      public function YN2016WangzhezhanqiPanel()
      {
         super();
         width = 400;
         height = 180 + 275;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("王者战旗");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ItemFace = null;
         this.spr = new Sprite();
         addChild(this.spr);
         this.selectSpr = new Sprite();
         addChild(this.selectSpr);
         _loc1_ = 0;
         while(_loc1_ < this.goArr.length)
         {
            _loc2_ = new ItemFace(new Goods(int(this.goArr[_loc1_])),65,65);
            _loc2_.x = 25 + 70 * int(_loc1_ % 5);
            _loc2_.y = 25 + 70 * int(_loc1_ / 5);
            _loc2_.name = this.goArr[_loc1_];
            _loc2_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            this.spr.addChild(_loc2_);
            _loc1_++;
         }
         this.btn = new SecondButton();
         this.btn.x = 240 - 82;
         this.btn.y = 105 + 280;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[89,this.selectID]);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if(this.selectSpr.getChildByName("selectMC"))
         {
            this.selectSpr.removeChild(this.selectMC);
         }
         this.selectID = int(_loc2_.name);
         this.selectMC = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016yuanxiaojie/select.swf");
         this.selectMC.name = "selectMC";
         this.selectMC.x = _loc2_.x - 2;
         this.selectMC.y = _loc2_.y - 2;
         this.selectSpr.addChild(this.selectMC);
      }
   }
}

