package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.shell.view.components.party.Party_managerListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class PartyPanel extends FPanel
   {
      
      public static const UI_PARTYPANEL_MODFIY_AFFICHE:String = "UI_PARTYPANEL_MODFIY_AFFICHE";
      
      public static const UI_PARTYPANEL_PARTYFIGHT_AFFICHE:String = "UI_PARTYPANEL_PARTYFIGHT_AFFICHE";
      
      public static const UI_PARTYPANEL_GONGCHENG_AFFICHE:String = "UI_PARTYPANEL_GONGCHENG_AFFICHE";
      
      public static const UI_PARTYPANEL_PARTY_LIST_SHOW:String = "UI_PARTYPANEL_PARTY_LIST_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_FLAG_SHOW:String = "UI_PARTYPANEL_PARTY_FLAG_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_KUNGFU_SHOW:String = "UI_PARTYPANEL_PARTY_KUNGFU_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_TASK_SHOW:String = "UI_PARTYPANEL_PARTY_TASK_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_FIGHT_SHOW:String = "UI_PARTYPANEL_PARTY_FIGHT_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_XIANGYANG_SHOW:String = "UI_PARTYPANEL_PARTY_XIANGYANG_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_INFO_SHOW:String = "UI_PARTYPANEL_PARTY_INFO_SHOW";
      
      public static const UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW:String = "UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW";
      
      public static const UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW:String = "UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW";
      
      public static const UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW:String = "UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW";
      
      public static const UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK:String = "UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK";
      
      private var flagName:FTextArea;
      
      private var flagLv:FLabel;
      
      private var item:ItemFace;
      
      private var partyAfficheInput:FTextInput;
      
      private var bangZhanAfficheBtn:SmallButton;
      
      private var gongChengAfficheBtn:SmallButton;
      
      private var modifyBtn:SmallButton;
      
      private var partyInfo:FTextArea;
      
      private var memberList:FList;
      
      private var partyListBtn:SecondButton;
      
      private var partyFlagBtn:SecondButton;
      
      private var partyKungfuBtn:SecondButton;
      
      private var partyTaskBtn:SecondButton;
      
      private var partyFightBtn:SecondButton;
      
      private var xiangYangBtn:SecondButton;
      
      private var partyInfoBtn:SecondButton;
      
      private var memberInfoBtn:SecondButton;
      
      private var flagID:int;
      
      private var mv:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var rongyuBtn:SecondButton;
      
      private var bangpaiId:int = 0;
      
      public function PartyPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         var scroll:FVScorllBar;
         var ft:FTextArea;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 378;
         titleText = LanResManager.getLanCommonTextWords("帮会");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         lb = new FLabel();
         with(lb)
         {
            x = 55;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗名称") + "：";
         }
         addChild(lb);
         this.flagName = new FTextArea();
         with(this.flagName)
         {
            x = 144;
            y = 6;
            width = 74;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗名称");
         }
         addChild(this.flagName);
         lb = new FLabel();
         with(lb)
         {
            x = 155;
            y = 46;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮旗等级") + "：";
         }
         addChild(lb);
         this.flagLv = new FLabel();
         with(this.flagLv)
         {
            x = 168;
            y = 64;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "1" + LanResManager.getLanCommonTextWords("级");
         }
         addChild(this.flagLv);
         lb = new FLabel();
         with(lb)
         {
            x = 155;
            y = 92;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("加成属性") + "：";
         }
         addChild(lb);
         this.partyAfficheInput = new FTextInput();
         with(this.partyAfficheInput)
         {
            x = 233;
            y = 30;
            width = 410;
            height = 106;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            type = TextFieldType.DYNAMIC;
            wordWrap = true;
         }
         addChild(this.partyAfficheInput);
         this.partyAfficheInput.setMaxChars(800);
         scroll = new FVScorllBar(this.partyAfficheInput,106);
         addChild(scroll);
         scroll.x = 643;
         scroll.y = 30;
         this.bangZhanAfficheBtn = new SmallButton();
         this.bangZhanAfficheBtn.label = LanResManager.getLanCommonTextWords("帮战公告");
         addChild(this.bangZhanAfficheBtn);
         this.bangZhanAfficheBtn.visible = false;
         this.bangZhanAfficheBtn.x = 233;
         this.bangZhanAfficheBtn.y = 140;
         this.bangZhanAfficheBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongChengAfficheBtn = new SmallButton();
         this.gongChengAfficheBtn.label = LanResManager.getLanCommonTextWords("攻城公告");
         this.gongChengAfficheBtn.visible = false;
         addChild(this.gongChengAfficheBtn);
         this.gongChengAfficheBtn.x = 298;
         this.gongChengAfficheBtn.y = 140;
         this.gongChengAfficheBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.modifyBtn = new SmallButton();
         this.modifyBtn.label = LanResManager.getLanCommonTextWords("修改");
         addChild(this.modifyBtn);
         this.modifyBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有帮主有权限修改公告") + "</font>";
         this.modifyBtn.x = 635;
         this.modifyBtn.y = 140;
         this.modifyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 256;
            y = 193;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("角色名");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 339;
            y = 193;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 388;
            y = 193;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮中职务");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 473;
            y = 193;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮中称号");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 570;
            y = 193;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本帮贡献");
         }
         addChild(lb);
         ft = new FTextArea();
         with(ft)
         {
            x = 22;
            y = 192;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"帮会信息") + "</textformat>";
         }
         addChild(ft);
         this.partyInfo = new FTextArea();
         with(this.partyInfo)
         {
            x = 88;
            y = 192;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.partyInfo);
         this.memberList = new FList();
         this.memberList.skin = "list";
         this.memberList.listWidth = 430;
         this.memberList.x = 227;
         this.memberList.y = 214;
         this.memberList.itemRenderer = new Party_managerListRender();
         addChild(this.memberList);
         this.memberList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.memberList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.partyListBtn = new SecondButton();
         this.partyListBtn.label = LanResManager.getLanCommonTextWords("帮会列表");
         addChild(this.partyListBtn);
         this.partyListBtn.x = 40;
         this.partyListBtn.y = 315;
         this.partyListBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyFlagBtn = new SecondButton();
         this.partyFlagBtn.label = LanResManager.getLanCommonTextWords("帮会旗帜");
         addChild(this.partyFlagBtn);
         this.partyFlagBtn.x = 116;
         this.partyFlagBtn.y = 315;
         this.partyFlagBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyKungfuBtn = new SecondButton();
         this.partyKungfuBtn.label = LanResManager.getLanCommonTextWords("帮会武学");
         addChild(this.partyKungfuBtn);
         this.partyKungfuBtn.x = 192;
         this.partyKungfuBtn.y = 315;
         this.partyKungfuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyTaskBtn = new SecondButton();
         this.partyTaskBtn.label = LanResManager.getLanCommonTextWords("帮会任务");
         this.partyTaskBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("本帮派成员可以每日完成的特殊任务") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("帮旗等级越高，则可以完成的任务种类就越丰富，完成后的任务奖励也越高") + "</font><br>";
         addChild(this.partyTaskBtn);
         this.partyTaskBtn.x = 268;
         this.partyTaskBtn.y = 315;
         this.partyTaskBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyFightBtn = new SecondButton();
         this.partyFightBtn.label = LanResManager.getLanCommonTextWords("帮会贡献");
         addChild(this.partyFightBtn);
         this.partyFightBtn.x = 344;
         this.partyFightBtn.y = 315;
         this.partyFightBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiangYangBtn = new SecondButton();
         this.xiangYangBtn.label = LanResManager.getLanCommonTextWords("襄阳归属");
         addChild(this.xiangYangBtn);
         this.xiangYangBtn.x = 420;
         this.xiangYangBtn.y = 315;
         this.xiangYangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyInfoBtn = new SecondButton();
         this.partyInfoBtn.label = LanResManager.getLanCommonTextWords("帮会见闻");
         addChild(this.partyInfoBtn);
         this.partyInfoBtn.x = 496;
         this.partyInfoBtn.y = 315;
         this.partyInfoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.memberInfoBtn = new SecondButton();
         this.memberInfoBtn.label = LanResManager.getLanCommonTextWords("成员信息");
         addChild(this.memberInfoBtn);
         this.memberInfoBtn.x = 572;
         this.memberInfoBtn.y = 315;
         this.memberInfoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rongyuBtn = new SecondButton();
         this.rongyuBtn.label = LanResManager.getLanCommonTextWords("帮派荣誉");
         addChild(this.rongyuBtn);
         this.rongyuBtn.x = 192 - 44 - 20;
         this.rongyuBtn.y = 315 - 40;
         this.rongyuBtn.visible = false;
         this.rongyuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.memberList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.label;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.memberList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.bangZhanAfficheBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTYFIGHT_AFFICHE));
               break;
            case this.gongChengAfficheBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_GONGCHENG_AFFICHE));
               break;
            case this.modifyBtn:
               if(this.modifyBtn.label == LanResManager.getLanCommonTextWords("修改"))
               {
                  this.partyAfficheInput.type = TextFieldType.INPUT;
                  this.partyAfficheInput.setSelection(0,this.partyAfficheInput.length);
                  this.modifyBtn.label = LanResManager.getLanCommonTextWords("确定");
                  Tools.currentStage.focus = this.partyAfficheInput;
               }
               else
               {
                  this.partyAfficheInput.type = TextFieldType.DYNAMIC;
                  this.modifyBtn.label = LanResManager.getLanCommonTextWords("修改");
                  dispatchEvent(new BaseEvent(UI_PARTYPANEL_MODFIY_AFFICHE,"",this.partyAfficheInput.text));
               }
               break;
            case this.partyListBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_LIST_SHOW));
               break;
            case this.partyFlagBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_FLAG_SHOW));
               break;
            case this.partyKungfuBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_KUNGFU_SHOW));
               break;
            case this.partyTaskBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_TASK_SHOW));
               break;
            case this.partyFightBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW));
               break;
            case this.xiangYangBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_XIANGYANG_SHOW));
               break;
            case this.partyInfoBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_INFO_SHOW));
               break;
            case this.memberInfoBtn:
               dispatchEvent(new BaseEvent(UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW));
               break;
            case this.rongyuBtn:
               dispatchEvent(new BaseEvent(UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW,"",this.bangpaiId));
         }
      }
      
      public function setInfo(param1:String, param2:int, param3:int, param4:Buff, param5:String, param6:Date, param7:String, param8:int, param9:int, param10:int, param11:String, param12:Boolean = false) : void
      {
         this.flagName.text = param1;
         this.flagLv.text = param2 + LanResManager.getLanCommonTextWords("等级");
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param4);
         addChild(this.item);
         this.item.x = 166;
         this.item.y = 116;
         this.partyInfo.htmlText = "<textformat leading=\'0.1\'>" + param5 + "<br>" + param6.fullYear + LanResManager.getLanCommonTextWords("年") + (param6.month + 1) + LanResManager.getLanCommonTextWords("月") + param6.date + LanResManager.getLanCommonTextWords("日") + "<br>" + param7 + "<br>" + param2 + "<br>" + param8 + "<br>" + param9 + "<br>" + param10 + "</textformat>";
         if(param11 == "")
         {
            this.partyAfficheInput.text = LanResManager.getLanCommonTextWords("帮主很懒，什么话都没写，大家一起鄙视他");
         }
         else
         {
            this.partyAfficheInput.text = param11;
         }
         this.modifyBtn.enabled = param12;
         this.flagID = param3;
         RslLoaderManager.lazyLoad(this.onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setFlagID(param1:int) : void
      {
         this.flagID = param1;
         RslLoaderManager.lazyLoad(this.onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      private function onCom() : void
      {
         if(Boolean(this.mv) && Boolean(this.mv.parent))
         {
            this.mv.parent.removeChild(this.mv);
            this.mv.stop();
         }
         this.mv = StaticValue.getMCByClassName(StaticValue.conversionFlagID(this.flagID)) as MovieClip;
         addChild(this.mv);
         this.mv.x = 29;
         this.mv.y = 29;
      }
      
      public function setFlagName(param1:String) : void
      {
         this.flagName.text = param1;
      }
      
      public function setAffiche(param1:String) : void
      {
         if(param1 == "")
         {
            this.partyAfficheInput.text = LanResManager.getLanCommonTextWords("帮主很懒，什么话都没写，大家一起鄙视他");
         }
         else
         {
            this.partyAfficheInput.text = param1;
         }
      }
      
      public function setMemberList(param1:XML) : void
      {
         this.memberList.dataProvider = param1;
      }
      
      public function setBangpairongyu(param1:int, param2:Boolean) : void
      {
         this.bangpaiId = param1;
         this.rongyuBtn.visible = param2;
      }
      
      public function setBangpaiList(param1:Array) : void
      {
         GameInstance.uiInstance.rongYuTargetPanel.setInitialize(param1,this.bangpaiId);
      }
      
      public function setChengchi(param1:Object) : void
      {
         GameInstance.uiInstance.rongYuTargetPanel.setChengchi(param1);
      }
   }
}

