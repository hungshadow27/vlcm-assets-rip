package com.tgame.common.vo.character
{
   import com.tgame.common.vo.character.info.AchieveInfo;
   import com.tgame.common.vo.character.info.AfkInfo2;
   import com.tgame.common.vo.character.info.AnQiInfo;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.ComboInfo;
   import com.tgame.common.vo.character.info.DynamicTaskInfo;
   import com.tgame.common.vo.character.info.FriendInfo;
   import com.tgame.common.vo.character.info.GirlInfo;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.common.vo.character.info.MoneyInfo;
   import com.tgame.common.vo.character.info.MountInfo;
   import com.tgame.common.vo.character.info.NpcFriendInfo;
   import com.tgame.common.vo.character.info.OtherPlayerInfo;
   import com.tgame.common.vo.character.info.ShoujiInfo;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.tgame.common.vo.character.info.TaskInfo;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.common.vo.character.info.WeddingInfo;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.moudels.feilongtanyunshou.model.info.FeiLongTanYunShouVO;
   import com.zcp.engine.SceneCharacter;
   
   public class Player extends BaseCharacter
   {
      
      public var isDiZi:Boolean;
      
      public var isZhuanSheng:Boolean;
      
      public var mainId:int;
      
      public var mainBangHuiId:int;
      
      private var _attributeInfo:AttributeInfo;
      
      private var _moneyInfo:MoneyInfo;
      
      private var _teamInfo:TeamInfo;
      
      private var _banghuiInfo:BanghuiInfo;
      
      private var _friendInfo:FriendInfo;
      
      private var _achieveInfo:AchieveInfo;
      
      private var _goodsInfo:GoodsInfo;
      
      private var _skillInfo:SkillInfo;
      
      private var _mountInfo:MountInfo;
      
      private var _girlInfo:GirlInfo;
      
      private var _npcFriendInfo:NpcFriendInfo;
      
      private var _lianzhanInfo:ComboInfo;
      
      private var _jingmaiInfo:JingmaiInfo;
      
      private var _taskInfo:TaskInfo;
      
      private var _otherPlayerInfo:OtherPlayerInfo;
      
      private var _afkInfo2:AfkInfo2;
      
      private var _shoujiInfo:ShoujiInfo;
      
      private var _anqiInfo:AnQiInfo;
      
      private var _feilongInfo:FeiLongTanYunShouVO;
      
      private var _weddingInfo:WeddingInfo;
      
      private var _yabiaoInfo:YabiaoInfo;
      
      private var _dynamicTaskInfo:DynamicTaskInfo;
      
      public function Player(param1:SceneCharacter)
      {
         super(param1);
      }
      
      public function get attributeInfo() : AttributeInfo
      {
         if(this._attributeInfo == null)
         {
            this._attributeInfo = new AttributeInfo();
         }
         return this._attributeInfo;
      }
      
      public function get moneyInfo() : MoneyInfo
      {
         if(this._moneyInfo == null)
         {
            this._moneyInfo = new MoneyInfo();
         }
         return this._moneyInfo;
      }
      
      public function get teamInfo() : TeamInfo
      {
         if(this._teamInfo == null)
         {
            this._teamInfo = new TeamInfo();
         }
         return this._teamInfo;
      }
      
      public function get banghuiInfo() : BanghuiInfo
      {
         if(this._banghuiInfo == null)
         {
            this._banghuiInfo = new BanghuiInfo();
         }
         return this._banghuiInfo;
      }
      
      public function get friendInfo() : FriendInfo
      {
         if(this._friendInfo == null)
         {
            this._friendInfo = new FriendInfo();
         }
         return this._friendInfo;
      }
      
      public function get achieveInfo() : AchieveInfo
      {
         if(this._achieveInfo == null)
         {
            this._achieveInfo = new AchieveInfo();
         }
         return this._achieveInfo;
      }
      
      public function get goodsInfo() : GoodsInfo
      {
         if(this._goodsInfo == null)
         {
            this._goodsInfo = new GoodsInfo();
         }
         return this._goodsInfo;
      }
      
      public function get skillInfo() : SkillInfo
      {
         if(this._skillInfo == null)
         {
            this._skillInfo = new SkillInfo();
         }
         return this._skillInfo;
      }
      
      public function get mountInfo() : MountInfo
      {
         if(this._mountInfo == null)
         {
            this._mountInfo = new MountInfo();
         }
         return this._mountInfo;
      }
      
      public function get girlInfo() : GirlInfo
      {
         if(this._girlInfo == null)
         {
            this._girlInfo = new GirlInfo();
         }
         return this._girlInfo;
      }
      
      public function get npcFriendInfo() : NpcFriendInfo
      {
         if(this._npcFriendInfo == null)
         {
            this._npcFriendInfo = new NpcFriendInfo();
         }
         return this._npcFriendInfo;
      }
      
      public function get lianzhanInfo() : ComboInfo
      {
         if(this._lianzhanInfo == null)
         {
            this._lianzhanInfo = new ComboInfo();
         }
         return this._lianzhanInfo;
      }
      
      public function get jingmaiInfo() : JingmaiInfo
      {
         if(this._jingmaiInfo == null)
         {
            this._jingmaiInfo = new JingmaiInfo();
         }
         return this._jingmaiInfo;
      }
      
      public function get taskInfo() : TaskInfo
      {
         if(this._taskInfo == null)
         {
            this._taskInfo = new TaskInfo();
         }
         return this._taskInfo;
      }
      
      public function get otherPlayerInfo() : OtherPlayerInfo
      {
         if(this._otherPlayerInfo == null)
         {
            this._otherPlayerInfo = new OtherPlayerInfo();
         }
         return this._otherPlayerInfo;
      }
      
      public function get afkInfo2() : AfkInfo2
      {
         if(this._afkInfo2 == null)
         {
            this._afkInfo2 = new AfkInfo2();
         }
         return this._afkInfo2;
      }
      
      public function get shoujiInfo() : ShoujiInfo
      {
         if(this._shoujiInfo == null)
         {
            this._shoujiInfo = new ShoujiInfo();
         }
         return this._shoujiInfo;
      }
      
      public function get anqiInfo() : AnQiInfo
      {
         if(this._anqiInfo == null)
         {
            this._anqiInfo = new AnQiInfo();
         }
         return this._anqiInfo;
      }
      
      public function get feilongInfo() : FeiLongTanYunShouVO
      {
         if(this._feilongInfo == null)
         {
            this._feilongInfo = new FeiLongTanYunShouVO();
         }
         return this._feilongInfo;
      }
      
      public function get weddingInfo() : WeddingInfo
      {
         if(this._weddingInfo == null)
         {
            this._weddingInfo = new WeddingInfo();
         }
         return this._weddingInfo;
      }
      
      public function get yabiaoInfo() : YabiaoInfo
      {
         if(this._yabiaoInfo == null)
         {
            this._yabiaoInfo = new YabiaoInfo();
         }
         return this._yabiaoInfo;
      }
      
      public function get dynamicTaskInfo() : DynamicTaskInfo
      {
         if(this._dynamicTaskInfo == null)
         {
            this._dynamicTaskInfo = new DynamicTaskInfo();
         }
         return this._dynamicTaskInfo;
      }
   }
}

