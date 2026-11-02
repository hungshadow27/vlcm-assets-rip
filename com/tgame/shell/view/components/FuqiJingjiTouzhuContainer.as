package com.tgame.shell.view.components
{
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FuqiJingjiTouzhuContainer extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var xiazhuLb:FLabel;
      
      private var xiazhuNumLb:FLabel;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var spContainer:Sprite;
      
      private var baoShiBigIco:DisplayObject;
      
      private var fc:FCanvas;
      
      public function FuqiJingjiTouzhuContainer()
      {
         super();
         skin = "panel";
         width = 500;
         height = 348;
         titleText = LanResManager.getLanCommonTextWords("夫妻竞技");
         this.fc = new FCanvas();
         this.fc.width = 84;
         this.fc.height = 100;
         this.fc.x = 10;
         this.fc.y = 2;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.width = 398;
         this.fc.height = 100;
         this.fc.x = 93;
         this.fc.y = 2;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.width = 580 - 99;
         this.fc.height = 203;
         this.fc.x = 10;
         this.fc.y = 101;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.xiazhuLb = new FLabel();
         with(this.xiazhuLb)
         {
            x = 25 - 8;
            y = 30;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("下注点数");
         }
         addChild(this.xiazhuLb);
         this.xiazhuNumLb = new FLabel();
         with(this.xiazhuNumLb)
         {
            x = 45;
            y = 50;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.xiazhuNumLb);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 15;
            y = 105;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择中意的宝石进行下注，可对同一颗宝石进行多倍下注。") + "<br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：只有队长才能进行下注！") + "</font>" + "</font></textformat>";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 15;
            y = 155;
            width = 465;
            height = 50;
            wordWrap = true;
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("秒后将在场地中刷出巨石，击碎巨石后出现的宝石与自己下注的宝石相同时，将获得积分，下注倍数越高，获得积分越多。") + "<br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：只有击碎巨石的队伍才有获得积分的权利！") + "</font>" + "</font></textformat>";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 15;
            y = 220;
            width = 515 - 36;
            height = 60;
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每分钟刷出一波九块巨石，全部巨石被击碎后计算双方获得的积分，积分较多的一方获胜，取得一定的侠侣值，积分越高，侠侣值越多。侠侣值可以在侠侣商店中购买侠侣碎片等道具，侠侣碎片可以在傲剑大使处锻造神器干将莫邪！") + "</font></textformat>";
         }
         addChild(this.ft3);
         this.ft4 = new FTextArea();
         with(this.ft4)
         {
            x = 15;
            y = 280;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("在尽可能击碎巨石赢得积分的同时压制对手让其无法获得积分。") + "</font></textformat>";
         }
         addChild(this.ft4);
         this.spContainer = new Sprite();
         addChild(this.spContainer);
      }
      
      public function setXiazhuNum(param1:int) : void
      {
         this.xiazhuNumLb.text = String(param1);
      }
      
      public function setXiazhuBaoshi(param1:Array) : void
      {
         var i:*;
         var onBtnClick:Function;
         var container:Sprite = null;
         var ico:Bitmap = null;
         var xzNumLb:FLabel = null;
         var xzBtn:SmallButton = null;
         var goodRes:GoodsRes = null;
         var bigKuang:DisplayObject = null;
         var bsArray:Array = param1;
         var len:int = int(bsArray.length);
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         i = 0;
         while(i < len)
         {
            onBtnClick = function(param1:MouseEvent):void
            {
               $parent.dispatchEvent(new BaseEvent(MainUI.UI_FUQIJINGJI_XIAZHU_CLICK,"",bsArray[param1.currentTarget.name].id));
            };
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,65,95);
               endFill();
            }
            container.name = i;
            container.x = 97 + container.width * i + 15 * i;
            container.y = 8;
            bigKuang = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuqijingji/bigkuang.swf");
            bigKuang.visible = true;
            bigKuang.x = 0;
            bigKuang.y = 0;
            container.addChild(bigKuang);
            goodRes = GoodsResManager.getGoodsRes(bsArray[i].id);
            ico = ResPathManager.getSmallICO(goodRes.id_ico_big,65,65);
            ico.x = 2;
            ico.y = 2;
            container.addChild(ico);
            xzNumLb = new FLabel();
            with(xzNumLb)
            {
               
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               x = container.width - xzNumLb.width - 18;
               y = 0;
            }
            container.addChild(xzNumLb);
            if(bsArray[i].xzNum > 0)
            {
               xzNumLb.text = "+" + bsArray[i].xzNum;
            }
            else
            {
               xzNumLb.text = "";
            }
            xzBtn = new SmallButton();
            xzBtn.name = i;
            xzBtn.label = LanResManager.getLanCommonTextWords("下注");
            container.addChild(xzBtn);
            xzBtn.x = (container.width - xzBtn.width) / 2;
            xzBtn.y = 70;
            xzBtn.addEventListener(MouseEvent.CLICK,onBtnClick);
            i++;
         }
      }
   }
}

