package com.tgame.shell.view.components.liunianhuodong
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.List;
   import game.skin.XuanMeiDaSaiSkin;
   import game.utils.SkinTools;
   
   public class YNHuazhuangdasaiPanel extends BasePanel
   {
      
      public static const HUAZHUANGDASAI_TOUPIAO:String = "HUAZHUANGDASAI_TOUPIAO";
      
      public static const HUAZHUANGDASAI_FANYE:String = "HUAZHUANGDASAI_FANYE";
      
      public static const HUAZHUANGDASAI_CANYU:String = "HUAZHUANGDASAI_CANYU";
      
      public static const HUAZHUANGDASAI_LINGJIANG:String = "HUAZHUANGDASAI_LINGJIANG";
      
      public static const HUAZHUANGDASAI_CHAKAN:String = "HUAZHUANGDASAI_CHAKAN";
      
      private var list:List;
      
      private var page:int = 1;
      
      private var pageMax:int = 1;
      
      private var zhezhao1:Sprite = new Sprite();
      
      public function YNHuazhuangdasaiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XuanMeiDaSaiSkin.skin,"xuanmeidasai");
         this.addChild(this.zhezhao1);
         $("shijianxinxi2",this,true).attr("text","Từ 00h00 đến 23h59 ngày 31 tháng 10 năm 2018");
         $("shijianxinxi1",this,true).attr("text","Từ 00h00 ngày 25 tháng 10 đến 23h59 ngày 30 tháng 10 năm 2018");
      }
      
      override protected function createVariableReference() : void
      {
         this.list = getChildByName("liebiao") as List;
         this.list.ItemClass = ListElement;
         this.list.horizontalGap = 12;
         this.list.columnCount = 3;
         $("lingjianganniu sousuoanniu canjiabisaianniu zuofanye youfanye",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():void
         {
            onClose();
         });
         this.zhezhao1.graphics.clear();
         this.zhezhao1.graphics.beginFill(16711680);
         this.zhezhao1.graphics.drawRect(255,218,670,360);
         this.zhezhao1.graphics.endFill();
         this.list.mask = this.zhezhao1;
      }
      
      public function setData(param1:Object) : void
      {
         $("ninpaiming",this,true).attr("text",param1.mingci);
         $("ninpiaoshu",this,true).attr("text",param1.piaoshu);
         this.pageMax = param1.pageMax;
         $("yeshu",this,true).attr("text",this.page + "/" + this.pageMax);
         dispatchEvent(new BaseEvent(HUAZHUANGDASAI_FANYE,"",this.page));
      }
      
      public function setListData(param1:Array, param2:int) : void
      {
         this.page = param2;
         $("yeshu",this,true).attr("text",this.page + "/" + this.pageMax);
         this.list.DataSource = param1;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            this.list.getChildAt(_loc3_).x = _loc3_ * 227;
            _loc3_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "lingjianganniu":
               dispatchEvent(new BaseEvent(HUAZHUANGDASAI_LINGJIANG));
               break;
            case "sousuoanniu":
               PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,9);
               break;
            case "canjiabisaianniu":
               dispatchEvent(new BaseEvent(HUAZHUANGDASAI_CANYU));
               break;
            case "zuofanye":
               if(this.page <= 1)
               {
                  return;
               }
               --this.page;
               dispatchEvent(new BaseEvent(HUAZHUANGDASAI_FANYE,"",this.page));
               break;
            case "youfanye":
               if(this.page >= this.pageMax)
               {
                  return;
               }
               ++this.page;
               dispatchEvent(new BaseEvent(HUAZHUANGDASAI_FANYE,"",this.page));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

import com.asQuery.$;
import com.tgame.PipeConstants;
import com.tgame.common.GameInstance;
import com.tgame.common.res.ResPathManager;
import com.tgame.common.res.goods.GoodsRes;
import com.tgame.common.res.goods.GoodsResManager;
import com.tgame.common.res.lan.LanResManager;
import com.tgame.common.res.mount.MountRes;
import com.tgame.common.res.mount.MountResManager;
import com.tgame.common.staticdata.SpecialGoodsID;
import com.tgame.common.vo.character.PurePlayer;
import com.tgame.common.vo.character.info.AttributeInfo;
import com.tgame.common.vo.character.info.AvatarInfo;
import com.tgame.common.vo.item.Goods;
import com.tgame.manager.AvatarManager;
import com.tgame.manager.NoticeManager;
import com.tgame.manager.PipeManager;
import com.tgame.shell.view.components.liunianhuodong.YNHuazhuangdasaiPanel;
import com.zcp.common.events.BaseEvent;
import com.zcp.engine.helper.SimpleAvatarSynthesizer;
import com.zcp.engine.staticdata.AvatarPartType;
import com.zcp.engine.vo.avatar.AvatarParamData;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import game.display.ListItemRender;

class ListElement extends ListItemRender
{
   
   private var _leftAvatar:Bitmap;
   
   public var $parent:DisplayObject;
   
   private var sp:Sprite;
   
   private var char_avatar_zizengFuQi:int = 0;
   
   public function ListElement()
   {
      super();
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
      $("toupiaoanniu chakanananniu",this,true).click(this.clickHanlder);
      this.$parent = GameInstance.uiInstance.$huazhuangdasaiPanel;
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      $("wenben1",this,true).attr("text",LanResManager.getLanCommonTextWords("名字") + "：" + param1.name).setIndexTop();
      $("wenben2",this,true).attr("text",LanResManager.getLanCommonTextWords("积分") + "：" + param1.piaoshu).setIndexTop();
      $("wenben3",this,true).attr("text",LanResManager.getLanCommonTextWords("排名") + "：" + param1.mingci).setIndexTop();
      if(param1.zaixian == 0)
      {
         $("wenben4",this,true).attr("text",LanResManager.getLanCommonTextWords("玩家不在线"));
         return;
      }
      this._leftAvatar = new Bitmap();
      this.sp = new Sprite();
      this.sp.mouseChildren = false;
      this.sp.mouseEnabled = false;
      addChild(this.sp);
      $("wenben4",this,true).attr("text","");
      var _loc2_:PurePlayer = new PurePlayer();
      _loc2_.isOnMount = param1.isOnMount;
      _loc2_.id = param1.id;
      _loc2_.avatarInfo.usingFashion = param1.usingFashion;
      _loc2_.avatarInfo.useAvatarType = param1.useAvatarType;
      param1.mountID = param1.mountID ? param1.mountID : -1;
      _loc2_.avatarInfo.isFeixing = param1.isFeixing;
      _loc2_ = this.setPurePlayer(param1.mountID,param1.partyID,_loc2_,param1.equipArr,param1.usingFashion,param1.useAvatarType);
      this.setFuQiCharAvatar(_loc2_);
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      var _loc2_:String = null;
      switch(param1.target.name)
      {
         case "toupiaoanniu":
            this.$parent.dispatchEvent(new BaseEvent(YNHuazhuangdasaiPanel.HUAZHUANGDASAI_TOUPIAO,"",data.id));
            break;
         case "chakanananniu":
            if(data.id)
            {
               GameInstance.lookPlayerID = data.id;
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
            }
            else
            {
               _loc2_ = LanResManager.getLanCommonTextWords("玩家不在线");
               NoticeManager.notify(NoticeManager.FOOT,_loc2_);
            }
      }
   }
   
   private function setFuQiCharAvatar(param1:PurePlayer) : void
   {
      var apdArr:Array;
      var callBack:Function = null;
      var $pPlayer:PurePlayer = param1;
      callBack = function(param1:*, param2:BitmapData):void
      {
         if(param1 != $pPlayer.id + "_" + char_avatar_zizengFuQi)
         {
            return;
         }
         setAvatar($pPlayer.id,param2,$pPlayer.avatarInfo.needChangeAvatarXY);
      };
      if(!$pPlayer)
      {
         return;
      }
      apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,$pPlayer.attributeInfo.getSex());
      SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizengFuQi,callBack,apdArr);
   }
   
   public function setAvatar(param1:int, param2:BitmapData, param3:Boolean = false) : void
   {
      this._leftAvatar.bitmapData = param2;
      this._leftAvatar.x = 110 - this._leftAvatar.width / 2;
      this._leftAvatar.y = 172 - this._leftAvatar.height + 110;
      this.sp.addChild(this._leftAvatar);
      $("wenben1",this,true).setIndexTop();
      $("wenben2",this,true).setIndexTop();
      $("wenben3",this,true).setIndexTop();
   }
   
   private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
   {
      var _loc10_:MountRes = null;
      var _loc11_:int = 0;
      var _loc12_:GoodsRes = null;
      var _loc7_:AttributeInfo = param3.attributeInfo;
      var _loc8_:AvatarInfo = param3.avatarInfo;
      _loc7_.partyID = param2;
      _loc8_.usingFashion = param5;
      _loc8_.useAvatarType = param6;
      if(param1 > 0)
      {
         if(_loc8_.usingFashion == 1)
         {
            _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
         }
         else if(_loc8_.useAvatarType > 0)
         {
            _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param6)),AvatarPartType.MOUNT);
         }
         else
         {
            _loc10_ = MountResManager.getMountRes(param1);
            if(_loc10_ != null)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc10_.id_m),AvatarPartType.MOUNT);
            }
         }
         _loc8_.lastMountId = param1;
      }
      var _loc9_:int = 0;
      while(_loc9_ < param4.length)
      {
         _loc11_ = (param4[_loc9_] as Goods).id;
         _loc12_ = GoodsResManager.getGoodsRes(_loc11_);
         if(_loc12_ != null)
         {
            AvatarManager.dressAvatarData(_loc8_,_loc12_.position,_loc12_.id_m,_loc7_.getSex());
         }
         _loc9_++;
      }
      return param3;
   }
}
