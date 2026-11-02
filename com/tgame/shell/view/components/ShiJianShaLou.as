package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ShiJianShaLou extends FPanel
   {
      
      public static const UI_SHIJIANSHALOU:String = "UI_SHIJIANSHALOU";
      
      public static const UI_SHIJIANSHALOU_SHENGJI_CLICK:String = "UI_SHIJIANSHALOU_SHENGJI_CLICK";
      
      public static const UI_SHIJIANSHALOU_LINGQU_CLICK:String = "UI_SHIJIANSHALOU_LINGQU_CLICK";
      
      public static const UI_SHIJIANSHALOU_YANGCHENG_CLICK:String = "UI_SHIJIANSHALOU_YANGCHENG_CLICK";
      
      private var chenaiFt:FTextArea;
      
      private var xiaohaoFt:FTextArea;
      
      private var shengjiBtn:SecondButton;
      
      private var lingquBtn:NewSkinButton;
      
      private var goumaiBtn:NewSkinButton;
      
      private var jiaChengFa1:FTextArea;
      
      private var jiaChengFa2:FTextArea;
      
      private var bg1:DisplayObject;
      
      private var jiangliSpr:Sprite;
      
      private var jiangliBg:DisplayObject;
      
      private var lingquBg:DisplayObject;
      
      private var weijihuoBg:DisplayObject;
      
      private var qianzhiFa:FTextArea;
      
      private var btnYangCheng:SecondButton;
      
      private var itemShiJianYi:ItemFace;
      
      public function ShiJianShaLou()
      {
         var shuoming:FTextArea = null;
         var img:Bitmap = null;
         var g:Goods = null;
         var item1:ItemFace = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("时间沙漏");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         this.dragRestrict = false;
         width = 500 + 10 + 180 + 132 - 43 - 185;
         height = 500 - 14 - 98 + 200 + 19 - 275;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijianshalou/bg.swf");
         this.bg1.x = 12;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijianshalou/bg1.swf");
         this.bg1.x = 150 + 10;
         this.bg1.y = 100 - 10 - 45;
         addChild(this.bg1);
         shuoming = new FTextArea();
         shuoming.x = 30;
         shuoming.y = 20;
         shuoming.textColor = StaticValue.GREEN;
         shuoming.width = 60;
         shuoming.height = 20;
         shuoming.htmlText = "<u>" + LanResManager.getLanCommonTextWords("玩法说明") + "</u>";
         addChild(shuoming);
         ToolTips.createToolTips(shuoming,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玩家在线1小时后领取免费时间沙漏，玩家每在线1分钟就记录1点时间尘埃。") + "<br>" + LanResManager.getLanCommonTextWords("时间尘埃可用于时间神器升级。") + "<br>" + LanResManager.getLanCommonTextWords("当天在线一小时未激活大奖的玩家第二天上线将重新计算在线时间。") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.chenaiFt = new FTextArea();
         this.chenaiFt.x = 240 + 15;
         this.chenaiFt.y = 50;
         this.chenaiFt.filters = StaticValue.filter;
         this.chenaiFt.textColor = StaticValue.GREEN;
         this.chenaiFt.width = 200;
         this.chenaiFt.height = 20;
         this.chenaiFt.htmlText = LanResManager.getLanCommonTextWords("世间尘埃");
         addChild(this.chenaiFt);
         this.xiaohaoFt = new FTextArea();
         this.xiaohaoFt.x = 160;
         this.xiaohaoFt.y = 240;
         this.xiaohaoFt.textColor = StaticValue.GREEN;
         this.xiaohaoFt.filters = StaticValue.filter;
         this.xiaohaoFt.width = 200;
         this.xiaohaoFt.height = 20;
         this.xiaohaoFt.htmlText = LanResManager.getLanCommonTextWords("消耗尘埃");
         addChild(this.xiaohaoFt);
         this.jiaChengFa1 = new FTextArea();
         this.jiaChengFa1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "";
         this.jiaChengFa1.x = 25 + 5 - 10 - 5 + 95;
         this.jiaChengFa1.y = 90 - 10 + 50;
         this.jiaChengFa1.filters = StaticValue.filter;
         this.jiaChengFa1.width = 305;
         this.jiaChengFa1.height = 150;
         addChild(this.jiaChengFa1);
         this.jiaChengFa2 = new FTextArea();
         this.jiaChengFa2.htmlText = "";
         this.jiaChengFa2.x = 170 - 10 - 10 - 6 + 95;
         this.jiaChengFa2.y = 90 - 10 + 50;
         this.jiaChengFa2.width = 140;
         this.jiaChengFa2.height = 150;
         this.jiaChengFa2.filters = StaticValue.filter;
         addChild(this.jiaChengFa2);
         this.jiangliSpr = new Sprite();
         addChild(this.jiangliSpr);
         this.qianzhiFa = new FTextArea();
         this.qianzhiFa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "";
         this.qianzhiFa.x = 410 + 190 - 272 + 83;
         this.qianzhiFa.y = 200;
         this.qianzhiFa.filters = StaticValue.filter;
         this.qianzhiFa.wordWrap = true;
         this.qianzhiFa.width = 170;
         this.qianzhiFa.height = 130;
         addChild(this.qianzhiFa);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 130;
         img.y = 75;
         g = new Goods(383339);
         item1 = new ItemFace(g);
         item1.x = 130 + 2;
         item1.y = 75 + 2;
         addChild(item1);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 130 + 130;
         img.y = 75;
         g = new Goods(383339);
         item1 = new ItemFace(g);
         item1.x = 130 + 2 + 130;
         item1.y = 75 + 2;
         addChild(item1);
         this.shengjiBtn = new SecondButton();
         this.shengjiBtn.x = 180;
         this.shengjiBtn.y = 190;
         this.shengjiBtn.label = LanResManager.getLanCommonTextWords("升级");
         addChild(this.shengjiBtn);
         this.shengjiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new NewSkinButton();
         this.lingquBtn.x = 450 + 190 - 272 + 83 + 20;
         this.lingquBtn.y = 240;
         this.lingquBtn.skin = "shijianshalou_lingqu_Button";
         addChild(this.lingquBtn);
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.goumaiBtn = new NewSkinButton();
         this.goumaiBtn.x = 450 + 190 - 272 + 83 + 20;
         this.goumaiBtn.y = 240;
         this.goumaiBtn.skin = "shijianshalou_goumai_Button";
         this.goumaiBtn.visible = false;
         addChild(this.goumaiBtn);
         this.goumaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijianshalou/yilingqu.swf");
         this.lingquBg.x = 100 + 485 - 272 + 83;
         this.lingquBg.y = 2;
         addChild(this.lingquBg);
         this.weijihuoBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijianshalou/weijihuo.swf");
         this.weijihuoBg.x = 100 + 485 - 272 + 83;
         this.weijihuoBg.y = 2;
         addChild(this.weijihuoBg);
         this.btnYangCheng = new SecondButton();
         this.btnYangCheng.x = 70;
         this.btnYangCheng.y = 45;
         this.btnYangCheng.label = LanResManager.getLanCommonTextWords("养成");
         this.btnYangCheng.name = SpecialGoodsID.SHIJIANYI + "";
         addChild(this.btnYangCheng);
         this.btnYangCheng.addEventListener(MouseEvent.CLICK,this.onClick);
         this.itemShiJianYi = new ItemFace(new Goods(SpecialGoodsID.SHIJIANYI));
         this.itemShiJianYi.x = 30;
         this.itemShiJianYi.y = 38;
         addChild(this.itemShiJianYi);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shengjiBtn:
               dispatchEvent(new BaseEvent(UI_SHIJIANSHALOU_SHENGJI_CLICK));
               break;
            case this.lingquBtn:
            case this.goumaiBtn:
               dispatchEvent(new BaseEvent(UI_SHIJIANSHALOU_LINGQU_CLICK));
               break;
            case this.btnYangCheng:
               dispatchEvent(new BaseEvent(UI_SHIJIANSHALOU_YANGCHENG_CLICK,"",int(param1.currentTarget.name)));
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:String, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int) : void
      {
         var _loc13_:Goods = null;
         this.chenaiFt.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.xiaohaoFt.htmlText = "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗尘埃") + "：</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2 + "</font>";
         this.setJiaChengText(param3,param4);
         this.setJiangli(param5);
         this.lingquBg.visible = param11;
         if(param5 == 0)
         {
            this.lingquBg.visible = false;
            this.weijihuoBg.visible = false;
            this.qianzhiFa.visible = false;
            this.lingquBtn.visible = false;
         }
         else
         {
            _loc13_ = new Goods(param9);
            this.qianzhiFa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + (param6 > 0 ? LanResManager.getLanCommonTextWords("充值") + " " + param6 + " Vàng" : "") + (param7 > 0 ? LanResManager.getLanCommonTextWords("消耗") + param7 + LanResManager.getLanCommonTextWords("元宝") : "") + (param8 > 0 ? LanResManager.getLanCommonTextWords("消耗") + Math.abs(param8) + LanResManager.getLanCommonTextWords("金票") : "") + LanResManager.getLanCommonTextWords("可领取") + _loc13_.res.name + "" + (param10 > 0 ? "X" + param10 + "" : "") + "</font >";
            if(param6 > 0)
            {
               this.lingquBtn.visible = true;
               this.goumaiBtn.visible = false;
            }
            else
            {
               this.lingquBtn.visible = false;
               this.goumaiBtn.visible = true;
            }
            if(param12 > 0)
            {
               this.weijihuoBg.visible = true;
            }
            else
            {
               this.weijihuoBg.visible = false;
            }
         }
         this.setJiHuo();
      }
      
      private function setJiHuo() : void
      {
         this.btnYangCheng.visible = GameState.dictMainStatus[SpecialGoodsID.SHIJIANYI];
         this.itemShiJianYi.visible = this.btnYangCheng.visible;
      }
      
      private function setJiangli(param1:int) : void
      {
         while(this.jiangliSpr.numChildren > 0)
         {
            this.jiangliSpr.removeChildAt(0);
         }
         this.jiangliBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijianshalou/" + param1 + ".swf");
         this.jiangliBg.x = 100 + 485 - 272 + 83;
         this.jiangliBg.y = 2;
         this.jiangliSpr.addChild(this.jiangliBg);
      }
      
      public function setJiaChengText(param1:String, param2:String) : void
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ += "" + _loc3_[_loc5_] + "<br>";
            _loc5_++;
         }
         var _loc6_:Array = param2.split(",");
         var _loc7_:String = "";
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            _loc7_ += "" + _loc6_[_loc5_] + "<br>";
            _loc5_++;
         }
         this.jiaChengFa1.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前属性加成") + "：</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc4_ + "</font></textformat>";
         this.jiaChengFa2.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化后属性加成") + "：</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc7_ + "</font></textformat>";
      }
   }
}

