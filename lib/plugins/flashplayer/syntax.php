<?php
/**
 * Plugin FlashPlayer: Flash Media Player in the wiki
 *
 * http://arnowelzel.de/wiki/misc/flashplayer
 * 
 * @license    BY-NC-SA (http://creativecommons.org/licenses/by-nc-sa/3.0/deed)
 * @author     Arno Welzel (based on the work of Sam Hall)
 */

// must be run within Dokuwiki
if(!defined('DOKU_INC')) die();
 
if(!defined('DOKU_PLUGIN')) define('DOKU_PLUGIN',DOKU_INC.'lib/plugins/');
require_once(DOKU_PLUGIN.'syntax.php');
 
/**
 * All DokuWiki plugins to extend the parser/rendering mechanism
 * need to inherit from this class
 */
class syntax_plugin_flashplayer extends DokuWiki_Syntax_Plugin {
	var $uid='';
	var $width=0;
	var $height=0;
	var $position=0;
	
    /**
     * return some info
     */
    function getInfo(){
        return array(
            'base'   => 'flashplayer',
            'author' => 'Arno Welzel',
            'email'  => 'himself@arnowelzel.de',
            'date'   => '2012-05-11',
            'name'   => 'FlashPlayer Plugin',
            'desc'   => 'Embeds JW Flash Player 5.8.2011 in the page, based on the work of Sam Hall',
            'url'    => 'http://arnowelzel.de/wiki/misc/flashplayer',
        );
    }
 
    function getType(){ return 'formatting'; }
    function getSort(){ return 158; }
    function connectTo($mode) { $this->Lexer->addEntryPattern('<flashplayer.*?>(?=.*?</flashplayer>)',$mode,'plugin_flashplayer'); }
    function postConnect() { $this->Lexer->addExitPattern('</flashplayer>','plugin_flashplayer'); }
 
 
    /**
     * Handle the match
     */
    function handle($match, $state, $pos, Doku_Handler $handler){
        switch ($state) {
            case DOKU_LEXER_ENTER :
                $attributes = strtolower(substr($match, 10, -1));
                $width = $this->_getNumericalAttribute($attributes, "width", "340");
                $height = $this->_getNumericalAttribute($attributes, "height", "20");
                $position = $this->_getNumericalAttribute($attributes, "position", "0");
				$uid = md5(uniqid(rand(), true));
                return array($state, array($width, $height, $position, $uid));
            case DOKU_LEXER_UNMATCHED :  return array($state, $match);
            case DOKU_LEXER_EXIT :       return array($state, '');
        }
        return array();
    }
 
    /**
     * Create output
     */
    function render($format, Doku_Renderer $renderer, $data) {
        if($mode == 'xhtml'){
            list($state, $vars) = $data;
            switch ($state) {
                case DOKU_LEXER_ENTER :      
					list($this->width, $this->height, $this->position, $this->uid) = $vars;
					switch($this->position)
					{
					case 1:
						$renderer->doc .= '<p style="text-align:center">';
						break;
					case 2:
						$renderer->doc .= '<p style="text-align:right">';
						break;
					}
					
					$renderer->doc .= '<object id="flv'.$this->uid.'"';
					$renderer->doc .= ' type="application/x-shockwave-flash"';
					$renderer->doc .= ' data="'.DOKU_BASE.'lib/plugins/flashplayer/player/player.swf"';
					$renderer->doc .= ' width="'.$this->width.'"';
					$renderer->doc .= ' height="'.$this->height.'"';
					$renderer->doc .= '>';
					$renderer->doc .= '<param name="movie" value="'.DOKU_BASE.'lib/plugins/flashplayer/player/player.swf" />';
					$renderer->doc .= '('.$this->getLang('getflash').')';
					$renderer->doc .= '<param name="allowfullscreen" value="true" />';
					// $renderer->doc .= '<param name="allowscriptaccess" value="always" />';
					$renderer->doc .= '<param name="flashvars" value="';
                    break;
					
                case DOKU_LEXER_UNMATCHED :
					$renderer->doc .= $renderer->_xmlEntities($vars);
					break;
					
                case DOKU_LEXER_EXIT :
					$renderer->doc .= '" />';
					$renderer->doc .= '</object>';
					
					switch($this->position)
					{
					case 1:
					case 2:
						$renderer->doc .= '</p>';
						break;
					}
					break;
            }
            return true;
        }
        return false;
    }
    
    function _getNumericalAttribute($attributeString, $attribute, $default){
        $retVal = $default;
        $pos = strpos($attributeString, $attribute."=");
        if ($pos === false) {
            //Maybe they have a space...
            $pos = strpos($attributeString, $attribute." ");
        }
        if ($pos > 0) {
            $pos = $pos + strlen($attribute);
            $value = substr($attributeString,$pos);
            
            //replace '=' and quote signs with null and trim leading spaces
            $value = str_replace("=","",$value);
            $value = str_replace("'","",$value);
            $value = str_replace('"','',$value);
            $value = ltrim($value);
            
            //grab the text before the next space
            $pos = strpos($value, " ");
            if ($pos > 0) {
                $value = substr($value,0,$pos);
            }
            
            //validate that it's numerical
            if (preg_match("^[0-9]+$^", $value)) $retVal = $value;
        }
        return $retVal;
    }
}
  
//Setup VIM: ex: et ts=4 enc=utf-8 :
