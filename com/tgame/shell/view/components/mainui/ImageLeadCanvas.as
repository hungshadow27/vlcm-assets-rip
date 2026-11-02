package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialNPCID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.text.*;
   
   public class ImageLeadCanvas extends FCanvas
   {
      
      private var _type:int;
      
      private var btn:SecondButton;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var title:FTextArea;
      
      private var tip:FTextArea;
      
      private var container:Sprite;
      
      private var tempGoods:Goods;
      
      private var taskID:int;
      
      private var taskRes:TaskRes;
      
      private var closeBtn:FSimpleButton;
      
      private var giftType:int;
      
      private var typeFun22:Function;
      
      private var typeFun23:Function;
      
      private var typeFun24:Function;
      
      private var typeFun25:Function;
      
      private var typeFun26:Function;
      
      private var _goto:String;
      
      private var squirrelGiftFun:Function;
      
      private var squirrelGiftID:int;
      
      private var squirrelGiftNextFun:Function;
      
      private var fun50581:Function;
      
      private var enShiLingFun:Function;
      
      private var zhizhanzhishangFun:Function;
      
      private var typeFun48:Function;
      
      private var typeFun49:Function;
      
      public function ImageLeadCanvas()
      {
         var tf:TextFormat;
         super();
         skin = "menuBg";
         width = 260;
         tf = new TextFormat();
         tf.align = "center";
         this.title = new FTextArea();
         with(this.title)
         {
            x = 5;
            y = 15;
            width = 250;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.YELLOW;
         }
         addChild(this.title);
         this.container = new Sprite();
         this.container.x = 5;
         this.container.y = 35;
         addChild(this.container);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 5;
            width = 250;
            wordWrap = true;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         addChild(this.tip);
         this.btn = new SecondButton();
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn1 = new SecondButton();
         addChild(this.btn1);
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn2 = new SecondButton();
         addChild(this.btn2);
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function resize(param1:int = 0, param2:Goods = null) : void
      {
         this.container.x = (width - this.container.width) / 2;
         this.tip.y = this.container.y + this.container.height + 10;
         this.btn.y = this.btn1.y = this.btn2.y = this.tip.y + this.tip.height + 10;
         if(this.btn.visible == true)
         {
            this.btn.x = 10;
         }
         if(this.btn1.visible == true)
         {
            this.btn1.x = (260 - this.btn1.width) / 2;
         }
         if(this.btn2.visible == true)
         {
            this.btn2.x = 250 - this.btn2.width;
         }
         height = this.tip.height + this.container.height + this.btn1.height + 65;
         if(param2 != null && param1 == 16)
         {
            if(param2.quality == 5 || param2.quality == 6)
            {
               this.tip.y = this.container.y + 39 + 10;
               height = this.tip.height + 39 + this.btn1.height + 65;
            }
         }
         if(param1 == 12)
         {
            this.btn.x += 35;
            this.btn2.x -= 35;
         }
      }
      
      private function reset() : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         this.btn.visible = false;
         this.btn2.visible = false;
      }
      
      public function onClose(param1:MouseEvent = null, param2:* = -1) : void
      {
         if(param2 is int)
         {
            if(this._type == param2)
            {
               if(parent)
               {
                  if(param2 == 29 || param2 == 47)
                  {
                     param2 = name;
                  }
                  parent.removeChild(this);
                  NewPlayerGuideStaticFun.newPlayerGuideImageLeadCanvasTipToNull(param2);
               }
            }
            else if(parent)
            {
               parent.removeChild(this);
               if(this._type == 29 || param2 == 47)
               {
                  NewPlayerGuideStaticFun.newPlayerGuideImageLeadCanvasTipToNull(name);
               }
               else
               {
                  NewPlayerGuideStaticFun.newPlayerGuideImageLeadCanvasTipToNull(this._type);
               }
            }
         }
         else if(param2 is String)
         {
            if(parent)
            {
               parent.removeChild(this);
               NewPlayerGuideStaticFun.newPlayerGuideImageLeadCanvasTipToNull(param2);
            }
         }
      }
      
      public function showTip(param1:int, param2:*) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         this.reset();
         this._type = param1;
         switch(param1)
         {
            case 1:
               this.title.text = LanResManager.getLanCommonTextWords("【新的潜能点】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"你有新的潜能点可用");
               this.btn1.label = LanResManager.getLanCommonTextWords("打开属性面板");
               break;
            case 2:
               this.title.text = LanResManager.getLanCommonTextWords("【坐骑升级】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"你有坐骑等级提升");
               this.btn1.label = LanResManager.getLanCommonTextWords("打开坐骑面板");
               break;
            case 3:
               this.title.text = LanResManager.getLanCommonTextWords("【技能学习】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"你有新的武功可以学习");
               this.btn1.label = LanResManager.getLanCommonTextWords("打开武功面板");
               break;
            case 4:
               this.title.text = LanResManager.getLanCommonTextWords("【武功升级】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"你有武功可以升级");
               this.btn1.label = LanResManager.getLanCommonTextWords("打开武功面板");
               break;
            case 5:
               this.tempGoods = param2 as Goods;
               this.title.text = LanResManager.getLanCommonTextWords("【新技能书】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的包裹里获得某技能书",[this.tempGoods.res.name]);
               this.btn1.label = LanResManager.getLanCommonTextWords("学习技能");
               break;
            case 6:
               this.taskRes = param2 as TaskRes;
               this.title.text = LanResManager.getLanCommonTextWords("【支线任务】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"你有新的支线任务可接");
               this.btn1.label = LanResManager.getLanCommonTextWords("打开任务面板");
               break;
            case 7:
               _loc4_ = param2 as Array;
               _loc6_ = _loc4_.length > 6 ? 6 : int(_loc4_.length);
               _loc5_ = 0;
               while(_loc5_ < _loc6_)
               {
                  _loc3_ = new ItemFace(_loc4_[_loc5_]);
                  this.container.addChild(_loc3_);
                  _loc3_.x = _loc5_ * 37;
                  _loc5_++;
               }
               this.title.text = LanResManager.getLanCommonTextWords("【装备修理】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"以上装备没有耐久度了",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往修理");
               break;
            case 8:
               this.title.text = LanResManager.getLanCommonTextWords("【包裹满了】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的包裹满了",[StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("打开包裹");
               break;
            case 9:
               this.title.text = LanResManager.getLanCommonTextWords("【药品短缺】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的背包中没有任何回复生命的药品",[StaticValue.GREEN_HTML,StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往药店买药");
               break;
            case 10:
               this.title.text = LanResManager.getLanCommonTextWords("【药品短缺】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的背包中没有任何回复内力的药品",[StaticValue.GREEN_HTML,StaticValue.BLUE_HTML,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往药店买药");
               break;
            case 11:
               this.title.text = LanResManager.getLanCommonTextWords("【药品短缺】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的背包中没有任何回复体力的药品",[StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往药店买药");
               break;
            case 12:
               this.title.text = LanResManager.getLanCommonTextWords("【真气修炼已满】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"打坐修炼的真气已经达到上限",[StaticValue.GREEN_HTML]);
               this.btn.visible = true;
               this.btn.label = LanResManager.getLanCommonTextWords("经脉冲穴");
               this.btn1.visible = false;
               this.btn2.visible = true;
               this.btn2.label = LanResManager.getLanCommonTextWords("提升武功");
               break;
            case 13:
               this.taskID = param2.taskID;
               this.title.text = LanResManager.getLanTextWords(this,"接受任务",[param2.taskName]);
               this.tip.htmlText = LanResManager.getLanTextWords(this,"点任务追踪",[StaticValue.BLUE_HTML,StaticValue.GREEN_HTML,StaticValue.BLUE_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往任务地点");
               break;
            case 14:
               this.taskID = param2.taskID;
               this.title.text = LanResManager.getLanTextWords(this,"完成任务",[param2.taskName]);
               this.tip.htmlText = LanResManager.getLanTextWords(this,"点任务追踪",[StaticValue.BLUE_HTML,StaticValue.GREEN_HTML,StaticValue.BLUE_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("回复任务");
               break;
            case 15:
               this.tempGoods = param2 as Goods;
               _loc3_ = new ItemFace(this.tempGoods);
               this.container.addChild(_loc3_);
               _loc3_.x = this.container.width / 2 - 15.5;
               this.title.text = this.tempGoods.res.name;
               this.tip.htmlText = LanResManager.getLanTextWords(this,"恭喜您获得珍贵装备",[StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("查看奖励");
               break;
            case 16:
               this.tempGoods = param2 as Goods;
               _loc3_ = new ItemFace(this.tempGoods);
               this.container.addChild(_loc3_);
               _loc3_.x = this.container.width / 2 - 15.5;
               this.title.text = this.tempGoods.res.name;
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您获得了一件更好的装备",[StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("佩戴物品");
               break;
            case 17:
               this.title.text = LanResManager.getLanCommonTextWords("【拾取物品】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"看到地面上爆出的物品了吗",[StaticValue.GOLD_HTML,StaticValue.YELLOW_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("确定");
               break;
            case 18:
               this.title.text = LanResManager.getLanCommonTextWords("【闭关满12小时】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"恭喜您闭关已达12小时",[StaticValue.GREEN_HTML,StaticValue.RED_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("领取闭关收益");
               break;
            case 19:
               this.giftType = param2 as int;
               this.title.text = LanResManager.getLanCommonTextWords("【可以领奖】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"领奖条件达成",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("领奖");
               break;
            case 20:
               this.title.text = LanResManager.getLanCommonTextWords("【暗器修炼已达到瓶颈】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的暗器修炼已达到瓶颈阶段",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("尝试突破瓶颈");
               break;
            case 21:
               this.title.text = LanResManager.getLanCommonTextWords("【第一件暗器】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"打开人物属性面板",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("打开暗器面板");
               break;
            case 22:
               this.typeFun22 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【分手一样是朋友】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的夫妻关系已经解散",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("取回1/2定情玉佩");
               break;
            case 23:
               this.typeFun23 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【定情玉佩升级】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"恭喜您，您的定情玉佩已升级",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("取回1/2定情玉佩");
               break;
            case 24:
               this.typeFun24 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【新的耳边轻语】");
               this.tip.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("您收到了一条来自于TA的新的耳边轻语。") + "</font></textformat>";
               this.btn1.label = LanResManager.getLanCommonTextWords("打开查看");
               break;
            case 25:
               _loc7_ = param2 as Array;
               _loc8_ = int(_loc7_[0]);
               _loc9_ = _loc7_[1];
               _loc10_ = _loc7_[2];
               this.typeFun25 = _loc7_[3];
               this.title.text = LanResManager.getLanCommonTextWords("【新的婚宴】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"TA特地为您举办了一场",[StaticValue.GREEN_HTML,_loc9_,_loc8_]);
               this.btn1.label = LanResManager.getLanCommonTextWords("确定");
               break;
            case 26:
               this.typeFun26 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【婚宴红包】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您还没有领走您的婚宴红包",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("领取红包");
               break;
            case 27:
               _loc11_ = param2 as String;
               this.title.text = LanResManager.getLanCommonTextWords("【箭支用馨】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您背包中的箭支已经消耗完毕",[StaticValue.WHITE_HTML,_loc11_,StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("前往购买");
               break;
            case 28:
               _loc12_ = param2 as String;
               this.title.text = LanResManager.getLanCommonTextWords("防沉迷提示");
               this.tip.htmlText = _loc12_;
               this.btn1.label = LanResManager.getLanCommonTextWords("确定");
               break;
            case 29:
               name = param2.name;
               this.title.htmlText = name;
               this.tip.htmlText = param2.str;
               this._goto = param2._goto;
               this.btn1.label = param2._goto == "" ? LanResManager.getLanCommonTextWords("确定") : LanResManager.getLanCommonTextWords("前往参与");
               break;
            case 30:
               this.title.text = LanResManager.getLanCommonTextWords("【跨服收益】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您有跨服收益尚未领取",[StaticValue.WHITE_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("打开领取面板");
               break;
            case 31:
               this.squirrelGiftFun = param2.fun;
               this.squirrelGiftID = param2.id;
               this.squirrelGiftNextFun = param2.nextFun;
               this.title.text = LanResManager.getLanCommonTextWords("【您最后一次兑奖的奖品还有没有领走】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 32:
               this.title.text = LanResManager.getLanCommonTextWords("【跨服华山论剑台活动已经开启】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("跨服华山论剑台活动已经开启...");
               this.btn1.label = LanResManager.getLanCommonTextWords("前往参与");
               break;
            case 33:
               this.title.text = LanResManager.getLanCommonTextWords("【洞箫修炼已达瓶颈】");
               this.tip.htmlText = LanResManager.getLanTextWords(this,"您的洞箫修炼已达瓶颈阶段。",[StaticValue.GREEN_HTML]);
               this.btn1.label = LanResManager.getLanCommonTextWords("尝试突破瓶颈");
               this.fun50581 = param2 as Function;
               break;
            case 34:
               this.squirrelGiftFun = param2.fun;
               this.squirrelGiftID = param2.id;
               this.squirrelGiftNextFun = param2.nextFun;
               this.title.text = LanResManager.getLanCommonTextWords("【您最后一次兑奖的奖品还有没有领走】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 35:
               this.enShiLingFun = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("恩师令");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("使用恩师令，可获得巨额经验，出师更迅速。");
               this.btn1.label = LanResManager.getLanCommonTextWords("使用恩师令");
               break;
            case 36:
               this.squirrelGiftFun = param2.fun;
               this.squirrelGiftID = param2.id;
               this.squirrelGiftNextFun = param2.nextFun;
               this.title.text = LanResManager.getLanCommonTextWords("【您最后一次兑奖的奖品还有没有领走】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 37:
               this.squirrelGiftFun = param2.fun;
               this.squirrelGiftID = param2.id;
               this.squirrelGiftNextFun = param2.nextFun;
               this.title.text = LanResManager.getLanCommonTextWords("【您最后一次兑奖的奖品还有没有领走】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 38:
               if(param2 == "0")
               {
                  this.title.text = LanResManager.getLanCommonTextWords("比武大会庆功宴");
               }
               else
               {
                  this.title.text = LanResManager.getLanCommonTextWords("跨平台比武大会") + LanResManager.getLanCommonTextWords("庆功宴");
               }
               this.tip.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("比武大会盛世举行武林至尊谁与争锋") + "</font><br>" + "<font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("庆功宴说明2") + "</font><br>" + "<font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("庆功宴说明3") + "</font><br>" + "</font></textformat>";
               this.btn1.label = LanResManager.getLanCommonTextWords("确定");
               break;
            case 50:
               this.squirrelGiftFun = param2.fun;
               this.squirrelGiftID = param2.id;
               this.squirrelGiftNextFun = param2.nextFun;
               this.title.text = LanResManager.getLanCommonTextWords("【您最后一次兑奖的奖品还有没有领走】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 47:
               name = param2.name;
               this.title.htmlText = name;
               this.tip.htmlText = param2.str;
               this._goto = param2.goto;
               this.btn1.label = LanResManager.getLanCommonTextWords("领取");
               break;
            case 44:
               this.title.text = LanResManager.getLanCommonTextWords("魔血已满");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("当前魔血值已达上限，不再增加") + "<br />" + LanResManager.getLanCommonTextWords("请尽快消耗魔血值") + "<br />" + LanResManager.getLanCommonTextWords("推荐使用途径") + "<br />" + LanResManager.getLanCommonTextWords("赤血魔阵提升，魔血灌注");
               this.btn.visible = true;
               this.btn.label = LanResManager.getLanCommonTextWords("魔血扩充");
               this.btn1.label = LanResManager.getLanCommonTextWords("修炼兽元");
               this.btn1.visible = true;
               this.btn2.visible = true;
               this.btn2.label = LanResManager.getLanCommonTextWords("魔血灌注");
               break;
            case 46:
               this.title.text = LanResManager.getLanCommonTextWords("【炼气已达瓶颈】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("您的炼气已达瓶颈阶段") + "<br />" + LanResManager.getLanCommonTextWords("突破瓶颈后您将能继续获得炼气以增加属性") + "<br />";
               this.btn1.label = LanResManager.getLanCommonTextWords("尝试突破瓶颈");
               this.btn1.visible = true;
               break;
            case 47:
               this.title.text = LanResManager.getLanCommonTextWords("神雕情缘");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("恭喜您与您的另一半赢得了今晚的神雕情缘活动举办权,请于20：00-20:30期间与您的另一半组队前往襄阳城月下老人处开启神雕情缘活动。注意：活动期间内如果您没有开启神雕情缘活动，则无法获得神雕之羽。");
               this.btn1.label = LanResManager.getLanCommonTextWords("确定");
               break;
            case 48:
               this.typeFun48 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【分手一样是朋友】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("您的夫妻关系已经解散。恭喜您重新获得了自由之身。现在开始去寻找一份新的幸福吧。在这之前您可以取得对剑中的一把作为纪念，如果您无法释怀，不妨在取回后摧毁。");
               this.btn1.label = LanResManager.getLanCommonTextWords("取回1/2干将莫邪");
               break;
            case 51:
               this.zhizhanzhishangFun = param2.fun;
               this.title.text = "【您有未领取的止战之殇奖励】";
               this.tip.htmlText = LanResManager.getLanCommonTextWords("请点击下方按钮领走奖励，以免造成损失");
               this.btn1.label = LanResManager.getLanCommonTextWords("领走奖励");
               break;
            case 49:
               this.typeFun49 = param2 as Function;
               this.title.text = LanResManager.getLanCommonTextWords("【分手一样是朋友】");
               this.tip.htmlText = LanResManager.getLanCommonTextWords("您的夫妻关系已经解散。恭喜您重新获得了自由之身。现在开始去寻找一份新的幸福吧。在这之前您可以取得夫妻的物品作为纪念，如果您无法释怀，不妨在取回后摧毁。");
               this.btn1.label = LanResManager.getLanCommonTextWords("取回夫妻道具");
         }
         this.resize(this._type,this.tempGoods);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:String = null;
         switch(this._type)
         {
            case 1:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
               }
               break;
            case 2:
               if(!Fun.isVisible(GameInstance.uiInstance._rideAttrPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
               }
               break;
            case 3:
               if(!Fun.isVisible(GameInstance.uiInstance._kungFuPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               }
               break;
            case 4:
               if(!Fun.isVisible(GameInstance.uiInstance._kungFuPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               }
               break;
            case 5:
               if(!Fun.isVisible(GameInstance.uiInstance._kungFuPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
               }
               break;
            case 6:
               if(!Fun.isVisible(GameInstance.uiInstance._taskPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE);
                  GameInstance.uiInstance.taskPanel.showAcceptableTaskPanel();
               }
               break;
            case 7:
               MainCharSeachPathManager.mainCharWalk(SpecialNPCID.EQUIP_NPC_ID_WITH_XIANGYANGCHENG);
               break;
            case 8:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               break;
            case 9:
               if(GameInstance.scene.mapConfig.mapID != 20001)
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIANGYANGCHENG);
               }
               else
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIN_SHOU_CUN);
               }
               break;
            case 10:
               if(GameInstance.scene.mapConfig.mapID != 20001)
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIANGYANGCHENG);
               }
               else
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIN_SHOU_CUN);
               }
               break;
            case 11:
               if(GameInstance.scene.mapConfig.mapID != 20001)
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIANGYANGCHENG);
               }
               else
               {
                  MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ITEM_NPC_ID_WITH_XIN_SHOU_CUN);
               }
               break;
            case 12:
               switch(param1.target)
               {
                  case this.btn:
                     if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                        PipeManager.sendMsg(PipeConstants.SWAP_JINGMAI_ZONGLAN);
                     }
                     break;
                  case this.btn1:
                     break;
                  case this.btn2:
                     if(!Fun.isVisible(GameInstance.uiInstance._kungFuPanel))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUNGFU);
                     }
               }
               break;
            case 13:
               TaskTracker.doTaskNextBehavior(this.taskID);
               break;
            case 14:
               TaskTracker.doTaskNextBehavior(this.taskID);
               break;
            case 15:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               break;
            case 16:
               _loc2_ = new ItemFace(this.tempGoods);
               _loc3_ = localToGlobal(new Point(this.tip.x,this.tip.y));
               _loc4_ = GameInstance.uiInstance.mainUI.getFunctionContainerXY();
               ItemMoveMovieManager.move(_loc2_,_loc3_.x,_loc3_.y,_loc4_.x + 40,_loc4_.y,1,2);
               PipeManager.sendMsg(PipeConstants.ITEM_USE,[new ItemFace(this.tempGoods),0]);
               break;
            case 17:
               break;
            case 18:
               if(!Fun.isVisible(GameInstance.uiInstance._biguanPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BIGUAN_PANEL);
               }
               break;
            case 19:
               if(!Fun.isVisible(GameInstance.uiInstance._giftPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
                  if(this.giftType == 3)
                  {
                     GameInstance.uiInstance.giftPanel.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("登录与在线奖励"));
                     GameInstance.uiInstance.giftPanel.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW));
                  }
                  if(this.giftType == 4)
                  {
                     GameInstance.uiInstance.giftPanel.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("登录与在线奖励"));
                     GameInstance.uiInstance.giftPanel.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_JIANMIAN_SHOW));
                  }
               }
               break;
            case 20:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                  GameInstance.uiInstance.charAttribute.showAnqi(true);
               }
               break;
            case 21:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                  GameInstance.uiInstance.charAttribute.showAnqi(true);
               }
               break;
            case 22:
               if(this.typeFun22 != null)
               {
                  this.typeFun22();
               }
               break;
            case 23:
               if(this.typeFun23 != null)
               {
                  this.typeFun23();
               }
               break;
            case 24:
               if(this.typeFun24 != null)
               {
                  this.typeFun24();
               }
               break;
            case 25:
               if(this.typeFun25 != null)
               {
                  this.typeFun25();
               }
               break;
            case 26:
               if(this.typeFun26 != null && !Fun.isVisible(GameInstance.uiInstance._marriageCashGiftListPanel))
               {
                  this.typeFun26();
               }
               break;
            case 27:
               MainCharSeachPathManager.mainCharWalk(SpecialNPCID.ZAHUO_NPC_ID_WITH_XIANGYANGCHENG);
               break;
            case 28:
               if(ExternalInterface.available && GameConfig.idCardUrl != "")
               {
                  ExternalInterface.call("window.open",GameConfig.idCardUrl,"_target","");
               }
               break;
            case 29:
               if(this._goto != "")
               {
                  _loc5_ = this._goto.replace(/^{\s*link\s*#\s*scene\s*:\s*([\-\d]+)\s*,\s*x\s*:\s*([\-\d]+)\s*,\s*y\s*:\s*([\-\d]+)\s*,\s*dis\s*:\s*([\-\d]+)\s*,\s*npc\s*:\s*([\-\d]+)\s*}.+{\s*\/\s*link\s*}$/,"$1,$2,$3,$4,$5");
                  MainCharSeachPathManager.mainCharWalk(_loc5_);
               }
               break;
            case 30:
               if(!Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
               {
                  PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               }
               break;
            case 31:
               if(Boolean(this.squirrelGiftFun))
               {
                  this.squirrelGiftFun(this.squirrelGiftID,false);
                  if(Boolean(this.squirrelGiftNextFun) && !Fun.isVisible(GameInstance.uiInstance._squirrelGiftPanel))
                  {
                     this.squirrelGiftNextFun();
                  }
               }
               break;
            case 32:
               MainCharSeachPathManager.mainCharWalk(SpecialNPCID.XIANG_YANG_CHENG_FANG_YU_SHI);
               break;
            case 33:
               if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                  GameInstance.uiInstance.charAttribute.showDongxiao(true);
                  this.fun50581([GameInstance.mainChar.id,0]);
               }
               break;
            case 34:
               if(Boolean(this.squirrelGiftFun))
               {
                  this.squirrelGiftFun(this.squirrelGiftID);
               }
               break;
            case 35:
               if(Boolean(this.enShiLingFun))
               {
                  this.enShiLingFun();
               }
               break;
            case 36:
               if(Boolean(this.squirrelGiftFun))
               {
                  this.squirrelGiftFun(this.squirrelGiftID);
               }
               break;
            case 37:
               if(Boolean(this.squirrelGiftFun))
               {
                  this.squirrelGiftFun(this.squirrelGiftID);
               }
               break;
            case 47:
               NewPlayerGuideStaticFun.sendMsg50565();
               break;
            case 44:
               switch(param1.target)
               {
                  case this.btn:
                     if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                        GameInstance.uiInstance.charAttribute.showChiXueMoZhen();
                        GameInstance.uiInstance.charAttribute.requestShowChiXueMoZhen();
                     }
                     break;
                  case this.btn2:
                     if(!Fun.isVisible(GameInstance.uiInstance._moxueDollPanel))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
                        GameInstance.uiInstance.moxueDollPanel.showFullCanvas(true);
                     }
                     break;
                  case this.btn1:
                     if(!Fun.isVisible(GameInstance.uiInstance._ridePanel))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
                     }
               }
               break;
            case 46:
               switch(param1.target)
               {
                  case this.btn1:
                     if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
                        GameInstance.uiInstance.charAttribute.showLianQi();
                        GameInstance.uiInstance.charAttribute.requestShowLianQi();
                     }
               }
               break;
            case 50:
               if(Boolean(this.squirrelGiftFun))
               {
                  this.squirrelGiftFun(this.squirrelGiftID);
                  if(Boolean(this.squirrelGiftNextFun) && !Fun.isVisible(GameInstance.uiInstance._squirrelGiftPanel))
                  {
                     this.squirrelGiftNextFun();
                  }
               }
               break;
            case 48:
               if(this.typeFun48 != null)
               {
                  this.typeFun48();
               }
               break;
            case 51:
               if(Boolean(this.zhizhanzhishangFun))
               {
                  this.zhizhanzhishangFun();
               }
               break;
            case 49:
               if(this.typeFun49 != null)
               {
                  this.typeFun49();
               }
         }
         this.onClose(null,this._type);
      }
   }
}

