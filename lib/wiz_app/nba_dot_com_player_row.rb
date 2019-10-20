class WizApp::NbaDotComPlayerRow

  def initialize(row_document)
    @row_document = row_document
  end

  def player_name
    @row_document.css("td.player_name span.playerName a").text 
  end
  alias name player_name

  def player_number
    @row_document.css("td.player_name span.playerNumber").text 
  end

  def player_position
    @row_document.css("td.player_name span.playerPosition").text 
  end
 
  def games
    @row_document.css("td.gp").text.to_i
  end

  def pts
    @row_document.css("td.pts").text.to_i
  end

  def fg
    @row_document.css("td.fgm").text.to_i
  end

  def fg_percent
    @row_document.css("td.fgm_pct").text.to_i
  end

  def threepts
    @row_document.css("td.fg3_pct").text.to_i
  end

  def ft
    @row_document.css("td.ft_pct").text.to_i
  end

  def oreb
    @row_document.css("td.oreb").text.to_i
  end

  def dreb
    @row_document.css("td.dreb").text.to_i
  end

  def reb
    @row_document.css("td.reb").text.to_i
  end

  def ast
    @row_document.css("td.ast").text.to_i
  end

  def stl
    @row_document.css("td.stl").text.to_i
  end

  def turnovers
    @row_document.css("td.tov").text.to_i
  end

  def pf
    @row_document.css("td.pf").text.to_i
  end



end