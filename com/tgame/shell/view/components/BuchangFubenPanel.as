package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class BuchangFubenPanel extends FPanel
   {
      
      public static const UI_BUCHANGFUBENJINRU_CLICK:String = "UI_BUCHANGFUBENJINRU_CLICK";
      
      public static const UI_BUCHANGFUBENLINGQU_CLICK:String = "UI_BUCHANGFUBENLINGQU_CLICK";
      
      private var ft:FTextArea;
      
      private var btnIn:SecondButton;
      
      private var btnGet:SecondButton;
      
      private var img:DisplayObject;
      
      private var item:ItemFace;
      
      public function BuchangFubenPanel()
      {
         super();
         width = 530;
         height = 305;
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("补偿副本");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 280;
         this.ft.y = 30;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("傲剑GM：尊敬的玩家我们对不起你们，对于8月7日的回档我们深表歉意，请不要再打了，我身上真的没有勋章了，你们在打我也没有呀，我已经被打成猪头了，我知道错了，请你们原谅我。我们一定吸取教训，加倍努力为您提供更优质的游戏体验。") + "<br>" + LanResManager.getLanCommonTextWords("（补偿时间：2014年8月10日-2014年8月15日）");
         this.ft.wordWrap = true;
         this.ft.height = 150;
         this.ft.width = 230;
         addChild(this.ft);
         var _loc1_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc1_.x = 360;
         _loc1_.y = 150 + 25;
         addChild(_loc1_);
         this.item = new ItemFace(new Goods(372381));
         this.item.x = 362;
         this.item.y = 152 + 25;
         addChild(this.item);
         this.btnGet = new SecondButton();
         this.btnGet.x = 330;
         this.btnGet.y = 230;
         this.btnGet.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnGet.label = LanResManager.getLanCommonTextWords("打成猪头搜勋章");
         addChild(this.btnGet);
         this.img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/buchangfuben/bg.swf");
         this.img.x = 20;
         this.img.y = 20;
         addChild(this.img);
         this.btnIn = new SecondButton();
         this.btnIn.x = 70;
         this.btnIn.y = 230;
         this.btnIn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnIn.label = LanResManager.getLanCommonTextWords("点击进入GM休息区");
         addChild(this.btnIn);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btnGet:
               dispatchEvent(new BaseEvent(UI_BUCHANGFUBENLINGQU_CLICK));
               break;
            case this.btnIn:
               dispatchEvent(new BaseEvent(UI_BUCHANGFUBENJINRU_CLICK));
         }
      }
   }
}

