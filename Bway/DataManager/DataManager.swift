//
//  DataManager.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init(){}
    
    func getAllGames() -> [DataModel] {
        var games: [DataModel] = []
        games += cardGames
        games += gamesOfRisk
        games += boardGames
        
        return games
    }
    
    let gamesOfRisk: [DataModel] = [
        DataModel(
            title: "Games of Risk",
            gameplay: "",
            basicRules: "Classic games of chance and risk-based entertainment",
            image: "riskImage",
            isComplet: true
        ),
        DataModel(
            title: "Slots",
            gameplay: "A luck-based game with spinning reels.",
            basicRules: "Played on machines with 3-5 reels. Insert coins or credits, press a button or pull a lever to spin. Win by matching symbols across paylines (1 to 100+). Payouts vary by symbol combinations; progressive slots link multiple machines for bigger jackpots. No skill required—just luck. RTP typically 85-98%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Blackjack",
            gameplay: "A card game to beat the dealer without exceeding 21.",
            basicRules: "Uses 1-8 decks of 52 cards. Players get 2 cards, dealer gets 1 up, 1 down. Number cards are face value, face cards 10, Aces 1 or 11. Hit to draw, stand to stop. Bust over 21 and lose. Dealer hits on 16 or less, stands on 17+. Closest to 21 wins; ties push. Basic strategy lowers house edge to ~0.5%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Roulette",
            gameplay: "A betting game on a spinning wheel.",
            basicRules: "Uses a wheel with 37 (European) or 38 (American) slots (0-36, plus 00 in American). Bet on numbers, colors (red/black), or odd/even. Croupier spins the wheel, drops a ball. Win if it lands on your bet. Payouts range from 1:1 (even money) to 35:1 (single number). House edge is 2.7% (European) or 5.26% (American).",
            image: "riskIcon"
        ),
        DataModel(
            title: "Poker",
            gameplay: "A card game blending skill and luck to win chips.",
            basicRules: "Texas Hold’em: 52-card deck, 2-10 players. Each gets 2 private cards, 5 community cards dealt in stages (flop, turn, river). Bet in rounds; best 5-card hand wins (High Card to Royal Flush). Bluffing and reading opponents key. Antes/blinds start betting. House takes a rake (e.g., 5%).",
            image: "riskIcon"
        ),
        DataModel(
            title: "Craps",
            gameplay: "A dice game betting on roll outcomes.",
            basicRules: "Uses 2 dice, 2-20 players. Shooter rolls; first roll (come-out) wins on 7/11, loses on 2/3/12. Other numbers set a point—roll it again before 7 to win. Bets include Pass Line (with shooter), Don’t Pass (against). Payouts vary; house edge ~1.4% on basic bets.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Baccarat",
            gameplay: "A simple card game betting on hand totals.",
            basicRules: "Uses 6-8 decks. Bet on Player, Banker, or Tie. Two hands dealt 2 cards each; face cards and 10s are 0, others face value, Aces 1. Sum modulo 10 (e.g., 15 = 5). Third card drawn by rules if under 6. Closest to 9 wins. Banker bet has 1.06% house edge, Player 1.24%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Keno",
            gameplay: "A lottery-style number-matching game.",
            basicRules: "Players pick 1-20 numbers from 1-80, place a bet. 20 numbers drawn randomly. Payouts based on matches—e.g., pick 5, match 3 for small win, 5 for big payout. Odds vary; house edge often 20-30%. Simple, no skill, just pick and hope.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Video Poker",
            gameplay: "A slot-like poker game for one player.",
            basicRules: "Uses a 52-card deck. Bet, get 5 cards, hold or discard to improve hand. Payouts for pairs (Jacks or Better) up to Royal Flush (e.g., 250:1). Variants like Deuces Wild add wild cards. Optimal play can lower house edge to under 1%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Sic Bo",
            gameplay: "A dice game betting on triple rolls.",
            basicRules: "Uses 3 dice. Bet on outcomes—specific numbers, totals (4-17), triples. Shaker rolls dice; payouts range from 1:1 (small/big bets) to 180:1 (specific triple). House edge varies (2.78% on small/big, up to 30% on triples). Pure chance.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Pai Gow Poker",
            gameplay: "A card game to beat the dealer with two hands.",
            basicRules: "Uses 53 cards (52 + 1 Joker). Deal 7 cards, split into 5-card (high) and 2-card (low) hands. Beat dealer’s two hands to win (1:1 minus 5% commission). Joker is wild for straights/flushes or Ace. House edge ~2.5% with strategy.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Three Card Poker",
            gameplay: "A fast poker game against the dealer.",
            basicRules: "Uses 52 cards, 3 dealt to player and dealer. Bet Ante and/or Pair Plus. Fold or play after seeing cards. Dealer needs Queen-high to qualify; beat dealer to win Ante/Play (1:1), Pair Plus pays for pairs+ (up to 40:1). House edge ~3.4%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Bingo",
            gameplay: "A game to match called numbers on a card.",
            basicRules: "Players get cards with 5x5 grids (1-75 numbers). Caller draws numbers randomly. Mark matches; first to complete a line (horizontal, vertical, diagonal) yells 'Bingo!' and wins. Prizes vary; house edge depends on ticket cost vs. payout.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Wheel of Fortune",
            gameplay: "A big wheel spin for instant wins.",
            basicRules: "Bet on symbols ($1, $5, $10, etc.) on a 52-section wheel. Spin lands between pins; match your bet to win (e.g., $5 bet on $5 pays 5:1). Simple, no skill. House edge varies by wheel setup, often 11-24%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Caribbean Stud Poker",
            gameplay: "A poker game against the house.",
            basicRules: "Uses 52 cards, 5 dealt to player and dealer (1 dealer card up). Bet Ante, then raise or fold. Dealer needs Ace-King or better to qualify. Beat dealer to win (1:1 + hand bonuses, e.g., 100:1 for Royal Flush). House edge ~5.2%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Let It Ride",
            gameplay: "A poker game to keep or pull bets.",
            basicRules: "Uses 52 cards, 5-card hand (3 player, 2 community). Place 3 equal bets; pull back 2 as cards reveal if weak. Payouts for Pair of 10s or better (1:1 to 1000:1 for Royal Flush). No dealer hand. House edge ~3.5% with strategy.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Spanish 21",
            gameplay: "A blackjack variant with bonus rules.",
            basicRules: "Uses 48-card deck (no 10s). Hit, stand, double, split like blackjack. Player 21 always wins, even vs. dealer 21. Bonuses for 5+ card 21s (e.g., 3:2). House edge ~0.4% with optimal play, slightly better than classic blackjack.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Casino War",
            gameplay: "A simple card comparison game.",
            basicRules: "Uses 52 cards. Bet, get 1 card, dealer gets 1. Higher card wins (Ace high). Tie? Go to 'war'—burn 3 cards, draw again; win doubles bet. House edge ~2.9%, or 18%+ if you surrender on ties.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Red Dog",
            gameplay: "A card game betting on a spread.",
            basicRules: "Uses 52 cards. Two cards dealt; bet if third card falls between them (e.g., 4 and 8, spread 3). Payouts rise with narrower spread (1:1 to 11:1). Consecutive or paired cards adjust rules. House edge ~3.2%.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Punto Banco",
            gameplay: "A baccarat variant with fixed rules.",
            basicRules: "Uses 6-8 decks. Bet on Punto (Player), Banco (Banker), or Tie. Two hands dealt, third card by strict rules. Closest to 9 wins. Banco bet pays 19:20 (5% commission), Punto 1:1, Tie 8:1. House edge ~1-14% depending on bet.",
            image: "riskIcon"
        ),
        DataModel(
            title: "Fan-Tan",
            gameplay: "A bead-based betting game.",
            basicRules: "Dealer covers beads, removes handfuls of 4. Bet on remaining beads (1-4). Win if your number matches (e.g., 3 beads left, bet on 3 pays 3:1 minus commission). Simple luck game. House edge ~5% due to commission.",
            image: "riskIcon"
        )
    ]
    
    let boardGames: [DataModel] = [
        DataModel(
            title: "Table Games",
            gameplay: "",
            basicRules: "Strategic board and table games",
            image: "tableImage",
            isComplet: true
        ),
        DataModel(
            title: "Chess",
            gameplay: "A strategic game of capturing the opponent's king.",
            basicRules: "Played on an 8x8 board with 16 pieces per player (1 King, 1 Queen, 2 Rooks, 2 Knights, 2 Bishops, 8 Pawns). Pieces move uniquely: Pawns forward (1-2 spaces), Rooks horizontally/vertically, Knights in an L-shape, Bishops diagonally, Queen anywhere, King one space. Goal is to checkmate the opponent’s King (threaten it with no legal escape). Castling and en passant are special moves. Stalemate ends in a draw.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Monopoly",
            gameplay: "A property-trading game to bankrupt opponents.",
            basicRules: "Uses a board with 40 spaces, 2-8 players. Roll 2 dice to move, buy properties, or pay rent if landing on owned spaces. Build houses/hotels to increase rent. Chance and Community Chest cards add events. Start with $1500; collect $200 passing Go. Goal is to be the last player with money by bankrupting others via rent or fees.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Scrabble",
            gameplay: "A word-forming game to score points.",
            basicRules: "Played on a 15x15 grid, 2-4 players. Each gets 7 letter tiles (100 total, scored 1-10). Form words on the board, connecting to existing ones. Premium squares (double/triple letter/word) boost scores. Pass or swap tiles if stuck. Game ends when tiles are gone and one player empties their rack; highest score wins after subtracting unplayed tiles.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Risk",
            gameplay: "A game of world domination through troop control.",
            basicRules: "Played on a world map with 42 territories, 2-6 players. Start with armies (number varies by player count). Roll dice to attack adjacent territories (attacker max 3, defender max 2 dice). Higher rolls win; ties favor defender. Conquer territories to earn reinforcements. Goal is to control all territories or complete a secret mission (in some versions).",
            image: "boardIcon"
        ),
        DataModel(
            title: "Catan",
            gameplay: "A resource-trading game to build settlements.",
            basicRules: "Played on a modular hex board, 3-4 players. Roll 2 dice to gather resources (wood, brick, wheat, sheep, ore) from hexes. Trade with players or ports to build roads (1 wood+1 brick), settlements (1 each of wood, brick, wheat, sheep), or cities (2 wheat+3 ore). Earn victory points: 1 per settlement, 2 per city. First to 10 points wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Clue",
            gameplay: "A deduction game to solve a murder mystery.",
            basicRules: "Played on a mansion board, 3-6 players. Determine who killed Dr. Black, with what weapon, and where. Each player gets character cards; remaining cards are the solution (hidden). Roll dice to move, suggest or accuse based on rooms/weapons. Eliminate options via others’ responses. First correct accusation wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Ticket to Ride",
            gameplay: "A railway-building game to connect cities.",
            basicRules: "Played on a map with routes, 2-5 players. Draw train cards to claim routes by matching colors and lengths. Complete destination tickets (city pairs) for points; uncompleted tickets lose points. Longest continuous route earns a bonus. Game ends when a player has 2 or fewer trains left; highest score wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Carcassonne",
            gameplay: "A tile-laying game to build a medieval landscape.",
            basicRules: "2-5 players place tiles (roads, cities, fields) from a stack. Add meeples to claim features: roads (1 point per tile), cities (2 per tile), monasteries (9 if surrounded). Retrieve meeples when features complete. Fields score at end (3 per adjacent city). Game ends when tiles run out; highest score wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Pandemic",
            gameplay: "A cooperative game to stop global disease outbreaks.",
            basicRules: "Played on a world map, 2-4 players. Each takes a role (e.g., Medic, Scientist). Draw cards to move, treat diseases (remove cubes), or build research stations. Cure diseases by collecting 5 cards of one color at a station. Win by curing all 4 diseases; lose if outbreaks (8 max) or cubes run out.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Checkers",
            gameplay: "A capture game to eliminate opponent pieces.",
            basicRules: "Played on a 32-square board (8x8, alternating), 2 players. Each starts with 12 pieces on dark squares. Move diagonally forward one space; jump over opponent’s piece to capture (mandatory if possible). Reach the opponent’s end to king a piece (moves backward too). Win by capturing all pieces or blocking moves.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Battleship",
            gameplay: "A guessing game to sink opponent ships.",
            basicRules: "Played on a 10x10 grid, 2 players. Each places 5 ships (sizes 2-5) secretly. Take turns calling coordinates (e.g., B-5) to hit or miss. Mark hits and misses on your tracking grid. Sink a ship by hitting all its squares. First to sink all opponent’s ships wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Trivial Pursuit",
            gameplay: "A trivia game to answer questions across categories.",
            basicRules: "Played on a wheel-shaped board, 2-6 players/teams. Roll a die to move and land on category spaces (e.g., History, Science). Answer a question correctly to earn a wedge (6 total). Reach the center and answer a final question to win. Incorrect answers pass turn.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Backgammon",
            gameplay: "A race to remove pieces from the board.",
            basicRules: "Played on a board with 24 triangles, 2 players. Each has 15 checkers. Roll 2 dice to move checkers toward your home board. Hit opponent’s lone checker to send it to the bar; re-enter from there. Bear off all checkers from home board to win. Doubling cube optional for stakes.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Dominion",
            gameplay: "A deck-building game to gain victory points.",
            basicRules: "2-4 players start with a small deck (7 copper, 3 estates). Buy cards from a shared pool (action, treasure, victory) using treasure cards. Play actions for effects (draw, attack, etc.), then buy one card per turn. Shuffle discard into deck when needed. Game ends when 3 piles or Provinces are gone; most victory points wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Pictionary",
            gameplay: "A drawing and guessing game.",
            basicRules: "Played with a board, 2+ teams. Roll to move and draw a word from a card (object, action, etc.) without speaking or writing. Team guesses within 1 minute to advance. All-play rounds occur on some spaces. First team to reach the end and guess a final word wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Agricola",
            gameplay: "A farming game to build a prosperous homestead.",
            basicRules: "2-5 players manage a farm on a personal board. Take actions (plow fields, build rooms, raise animals) by placing workers. Harvest crops and feed family (2 food per person) each round. Expand family for more actions. Game ends after 14 rounds; score for fields, animals, house, etc.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Ludo",
            gameplay: "A race to move all pieces home.",
            basicRules: "Played on a cross-shaped board, 2-4 players. Each has 4 pieces in their corner. Roll a die; move a piece clockwise that many spaces (6 to start). Land on an opponent’s piece to send it back. Reach the center triangle with exact rolls. First to get all 4 pieces home wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "The Game of Life",
            gameplay: "A life-simulation game to earn money and achievements.",
            basicRules: "Played on a winding track, 2-6 players. Spin a wheel to move; choose college or career at start. Land on spaces to gain/lose money, marry, have kids, or pay taxes. Collect LIFE tiles for milestones. Retire at game’s end; most money plus tile values wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Sequence",
            gameplay: "A card-and-chip game to form rows.",
            basicRules: "Played on a board with card images, 2-12 players/teams. Draw cards (standard deck) and place chips on matching board spaces. Goal is 5 chips in a row (2 rows for 2 players). Jacks are wild (two-eyed) or remove chips (one-eyed). First to complete required sequences wins.",
            image: "boardIcon"
        ),
        DataModel(
            title: "Axis & Allies",
            gameplay: "A WWII strategy game of territorial control.",
            basicRules: "Played on a world map, 2-5 players as Axis or Allies. Control nations with units (infantry, tanks, ships). Roll dice for combat; higher rolls win (attack vs. defense values). Earn IPCs from territories to buy units. Move, attack, and reinforce each turn. Win by capturing key enemy capitals.",
            image: "boardIcon"
        )
    ]
    
    let cardGames: [DataModel] = [
        DataModel(
            title: "Card Games",
            gameplay: "",
            basicRules: "Classic card games and modern favorites",
            image: "cards",
            isComplet: true
        ),
        DataModel(
            title: "Durak",
            gameplay: "A trick-taking game where players avoid being the last one with cards.",
            basicRules: "Played with a 36-card deck (6 and up). Each player starts with 6 cards. The goal is to discard all cards by playing higher cards of the same suit or trumps to beat attacks. One player attacks by playing a card, the defender must beat it or take it. If the defender succeeds, the attack moves to the next player. The trump suit is revealed from the bottom of the deck. The last player with cards is the 'fool' (Durak).",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Poker",
            gameplay: "A betting game where players aim to have the best hand.",
            basicRules: "Uses a standard 52-card deck. Players are dealt 5 cards (in Texas Hold'em, 2 private and 5 community cards). Hands rank from High Card to Royal Flush. Players bet in rounds, raising, calling, or folding based on their hand strength. The goal is to win the pot by having the best hand at showdown or forcing others to fold.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Blackjack",
            gameplay: "A game to beat the dealer by getting closer to 21 without going over.",
            basicRules: "Uses 1-8 standard 52-card decks. Players are dealt 2 cards, dealer gets 1 face-up and 1 face-down. Cards 2-10 are worth their value, face cards are 10, Ace is 1 or 11. Players can 'hit' (take more cards) or 'stand' (keep their total). Going over 21 is a bust. The dealer must hit on 16 or less and stand on 17 or more. Closest to 21 wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Solitaire",
            gameplay: "A solo game to organize cards into suit piles.",
            basicRules: "Uses a 52-card deck. Deal 7 columns (1 to 7 cards, top card up). Goal is to build 4 foundation piles from Ace to King by suit. Move cards between columns in descending order (King to Ace) and alternating colors. Draw from the stock pile one card at a time to help. Empty columns can take a King. Win by completing all foundations.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Bridge",
            gameplay: "A trick-taking game played in teams.",
            basicRules: "Uses a 52-card deck, 4 players in 2 teams. Each player gets 13 cards. After a bidding phase to set a trump suit and contract (tricks to win), one team tries to win tricks. A trick is won by the highest trump or highest card of the led suit. Scoring depends on tricks won versus the contract. Play continues until a rubber (best of 3 games) is won.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Hearts",
            gameplay: "A trick-taking game to avoid penalty points.",
            basicRules: "Uses a 52-card deck, 4 players. Each player gets 13 cards. Pass 3 cards to another player each round. Goal is to avoid taking hearts (1 point each) and the Queen of Spades (13 points). Lead with a non-heart if possible; follow suit if you can. Highest card of the led suit wins the trick. Lowest score wins, or 'shoot the moon' by taking all penalty cards for 0 points.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Rummy",
            gameplay: "A game to form sets and runs with your cards.",
            basicRules: "Uses a 52-card deck, 2-6 players. Each gets 10 cards (or 7 in some versions). Goal is to form melds: sets (3-4 of same rank) or runs (3+ consecutive cards of same suit). Draw a card from the deck or discard pile, then discard one. First to meld all cards wins, scoring points from opponents’ unmelded cards.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Go Fish",
            gameplay: "A simple game to collect sets of four.",
            basicRules: "Uses a 52-card deck, 2-6 players. Each gets 5 cards (7 if 2 players). Goal is to collect sets of 4 cards of the same rank. Players ask others for a rank they hold (e.g., 'Do you have any 3s?'). If yes, they give them; if no, 'Go Fish'—draw from the deck. Sets are laid down when complete. Most sets wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Spades",
            gameplay: "A team-based trick-taking game with bidding.",
            basicRules: "Uses a 52-card deck, 4 players in 2 teams. Each gets 13 cards. Teams bid how many tricks they’ll win. Spades are always trump. Lead any suit (no spades until broken), follow suit if possible, or trump with spades. Highest card or trump wins. Score 10 points per trick bid if met, penalties for over/under-bidding.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Crazy Eights",
            gameplay: "A shedding game using eights as wild cards.",
            basicRules: "Uses a 52-card deck, 2-7 players. Each gets 5 cards (7 if 2 players). Match the top discard by suit or rank, or play an 8 to change the suit. Draw if you can’t play. First to shed all cards wins; others score points for cards left (eights are 50, face cards 10, others face value).",
            image: "cardsIcon"
        ),
        DataModel(
            title: "War",
            gameplay: "A luck-based game of comparing card values.",
            basicRules: "Uses a 52-card deck, 2 players. Split deck evenly. Each flips a card; higher value wins both (Ace high). If tied, place 3 cards face-down, flip a 4th—higher wins all. Game ends when one player has all cards.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Euchre",
            gameplay: "A trick-taking game with a trump suit.",
            basicRules: "Uses a 24-card deck (9-Ace), 4 players in 2 teams. Each gets 5 cards. Top card sets trump; teams bid to name it. Goal is to win 3+ tricks. Trump suit ranks highest (Right Bower: Jack of trump, Left Bower: other Jack of same color), then A-K-Q-10-9. Score 1-2 points per round, first to 10 wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Pinochle",
            gameplay: "A trick-taking and melding game.",
            basicRules: "Uses a 48-card deck (2 sets of 9-Ace), 4 players in 2 teams. Each gets 12 cards. Meld sets (e.g., Ace-King-Queen-Jack-10 of trump) for points, then win tricks. Trump suit leads, Aces high. Score melds and tricks (1 point per 10 value). First to 150 wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Canasta",
            gameplay: "A melding game to score points with sets.",
            basicRules: "Uses 2 52-card decks + 4 jokers, 4 players in 2 teams. Each gets 11 cards. Form melds of 3+ cards of same rank (wild cards help). Draw 2, discard 1 per turn. Goal is 5,000 points; melds score based on card values (jokers 50, Aces 20, etc.). First team to meld all cards ends the round.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Old Maid",
            gameplay: "A game to avoid being left with the odd card.",
            basicRules: "Uses a 51-card deck (remove 1 Queen), 2-6 players. Deal all cards. Discard pairs of same rank. Players draw from each other’s hands, discarding pairs. Game ends when all pairs are gone; player with the Old Maid (unpaired Queen) loses.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Gin Rummy",
            gameplay: "A fast-paced melding game.",
            basicRules: "Uses a 52-card deck, 2 players. Each gets 10 cards. Form sets (3-4 of a rank) or runs (3+ in suit sequence). Draw from deck or discard, then discard. Knock when unmelded cards total 10 or less. Opponent lays down too; lowest deadwood wins the difference in points.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Uno",
            gameplay: "A shedding game with special action cards.",
            basicRules: "Uses a custom 108-card deck, 2-10 players. Each gets 7 cards. Match color or number to the top discard, or use action cards (Skip, Reverse, Draw 2/4, Wild). Draw if you can’t play. Say 'Uno' with 1 card left. First to shed all cards wins; others score points from cards left.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Cribbage",
            gameplay: "A scoring game with a pegboard.",
            basicRules: "Uses a 52-card deck, 2 players. Each gets 6 cards, discards 2 to a crib. Play cards alternately, counting to 31 (face cards 10, Ace 1). Score pairs, runs, and 15s during play and in hand. Dealer scores crib too. First to 121 points wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Snap",
            gameplay: "A fast reaction game to match cards.",
            basicRules: "Uses a 52-card deck, 2+ players. Split deck evenly. Players flip cards to a central pile one at a time. When two cards match (same rank), shout 'Snap!' First to shout takes the pile. Last player with cards wins.",
            image: "cardsIcon"
        ),
        DataModel(
            title: "Scopa",
            gameplay: "An Italian game to capture cards.",
            basicRules: "Uses a 40-card Italian deck (or 52-card deck, 8-10 removed), 2-4 players. Each gets 3 cards, 4 on table. Play a card to capture table cards of same value or sum to its value. Aces take all if no match. Score for most cards, sevens, coins, and sweeps. First to 11 points wins.",
            image: "cardsIcon"
        )
    ]
}
