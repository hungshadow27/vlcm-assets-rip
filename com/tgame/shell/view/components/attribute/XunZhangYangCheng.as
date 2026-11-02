package com.tgame.shell.view.components.attribute
{
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class XunZhangYangCheng extends Sprite
   {
      
      private var spContainer:Sprite;
      
      private var yangchengBtn:SecondButton;
      
      private var lingquBtn:SecondButton;
      
      private var ft:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var scroll:FVScorllBar;
      
      public function XunZhangYangCheng()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/bg.xunzhangyangcheng.swf");
         _loc1_.x = 1;
         _loc1_.y = 1;
         addChild(_loc1_);
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 308;
         this.ft.width = 390;
         this.ft.height = 52;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本界面收录了您所装备的所有可养成的勋章，您可以通过领取道具按钮一键领取永久活动中相对应的各类勋章养成道具，") + LanResManager.getLanCommonTextWords("然后通过一键养成增加所有可养成的勋章的属性。") + "</font></textformat>";
         addChild(this.ft);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.x = width / 2 / 2 - this.lingquBtn.width / 2;
         this.lingquBtn.y = 280;
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取道具");
         addChild(this.lingquBtn);
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yangchengBtn = new SecondButton();
         this.yangchengBtn.x = width / 2 + width / 2 / 2 - this.yangchengBtn.width / 2;
         this.yangchengBtn.y = 280;
         this.yangchengBtn.label = LanResManager.getLanCommonTextWords("一键养成");
         addChild(this.yangchengBtn);
         this.yangchengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spContainer = new Sprite();
         this.spContainer.x = 3;
         this.spContainer.y = 1;
         with(this.spContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,395,275);
            endFill();
         }
         addChild(this.spContainer);
         this.scroll = new FVScorllBar(this.spContainer,275);
         addChild(this.scroll);
         this.scroll.x = 385;
         this.scroll.y = 1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingquBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUNZHANGYANGCHENG_LINGQU_CLICK));
               break;
            case this.yangchengBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUNZHANGYANGCHENG_YANGCHENG_CLICK));
         }
      }
      
      public function setXunZhang(param1:Array) : void
      {
         var len:int;
         var j:int;
         var k:int;
         var bg_len:int;
         var i:*;
         var container:Sprite = null;
         var go:Goods = null;
         var item:ItemFace = null;
         var imgSpr:Sprite = null;
         var hdPic:DisplayObject = null;
         var dhAry:Array = param1;
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         len = int(dhAry.length);
         j = 0;
         k = 0;
         bg_len = 0;
         if(len < 12)
         {
            bg_len = 12;
         }
         else
         {
            bg_len = len;
         }
         i = 0;
         while(i < bg_len)
         {
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,65,68);
               endFill();
            }
            container.name = i;
            container.x = k * 94;
            container.y = j * 91;
            hdPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/bg.xunzhang.kuang.swf");
            hdPic.y = 2;
            hdPic.x = 2;
            container.addChild(hdPic);
            if(i < len)
            {
               go = new Goods(dhAry[i].id);
               go.roleID = GameInstance.mainChar.id;
               go.position = dhAry[i].position;
               item = new ItemFace(go,65,65);
               item.x = 16;
               item.y = 14;
               container.addChild(item);
               item.name = i;
               item.filters = [];
               imgSpr = new Sprite();
               imgSpr.mouseChildren = false;
               imgSpr.mouseEnabled = false;
               container.addChild(imgSpr);
            }
            k++;
            if((i + 1) % 4 == 0)
            {
               k = 0;
               j++;
            }
            i++;
         }
         this.scroll.update();
      }
      
      public function setBtn() : void
      {
         this.lingquBtn.enabled = false;
         this.yangchengBtn.enabled = false;
      }
   }
}

